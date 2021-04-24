from tensorflow import keras
import pandas as pd
from tensorflow import reduce_sum, ragged, function, math, reduce_mean
import time
from os import environ


class MaskedEmbeddingsAggregatorLayer(keras.layers.Layer):
    def __init__(self, agg_mode='sum', **kwargs):
        super(MaskedEmbeddingsAggregatorLayer, self).__init__(**kwargs)

        if agg_mode not in ['sum', 'mean']:
            raise NotImplementedError('mode {} not implemented!'.format(agg_mode))
        self.agg_mode = agg_mode

    @function
    def call(self, inputs, mask=None):
        masked_embeddings = ragged.boolean_mask(inputs, mask)
        if self.agg_mode == 'sum':
            aggregated = reduce_sum(masked_embeddings, axis=1)
        elif self.agg_mode == 'mean':
            aggregated = reduce_mean(masked_embeddings, axis=1)

        return aggregated

    def get_config(self):
        # this is used when loading a saved model that uses a custom layer
        return {'agg_mode': self.agg_mode}


class L2NormLayer(keras.layers.Layer):
    def __init__(self, **kwargs):
        super(L2NormLayer, self).__init__(**kwargs)

    @function
    def call(self, inputs, mask=None):
        if mask is not None:
            inputs = ragged.boolean_mask(inputs, mask).to_tensor()
        return math.l2_normalize(inputs, axis=-1)

    def compute_mask(self, inputs, mask):
        return mask


def get_data(corpus_path):
    corpus = pd.read_pickle(corpus_path)
    user_watch_history = pd.read_json(environ.get("DATA_COLLECTION_HOST") + "/api/history/get-history")

    return corpus, user_watch_history


def get_model(model_path):
    from os import path
    if not path.exists(model_path):
        raise Exception("model_path is not valid")
    return keras.models.load_model(model_path, custom_objects={
        'L2NormLayer': L2NormLayer,
        'MaskedEmbeddingsAggregatorLayer': MaskedEmbeddingsAggregatorLayer
    })


def generate_candidates(model_path, corpus_path):
    corpus, watch_history = get_data(corpus_path)

    """ Make Indexes for speedier revival """
    song_ids = corpus["song_id"].unique().tolist()
    song_2_index = {x: i for i, x in enumerate(song_ids)}
    # index_2_songid = {i: x for i, x in enumerate(song_ids)}

    user_ids = watch_history["user_id"].unique().tolist()
    user_2_index = {x: i for i, x in enumerate(user_ids)}
    index_2_userid = {i: x for i, x in enumerate(user_ids)}

    """ Encoded Song Ids and user Ids to feed to the network """
    watch_history['user_id'] = watch_history['user_id'].map(user_2_index)
    watch_history['song_id'] = watch_history['song_id'].map(song_2_index)

    """ Group user's watch history """
    watches_grouped = watch_history.groupby(['user_id'])['song_id'].apply(list).reset_index()

    """ Treat last watched as Past Prediction """
    watches_grouped['past_predicted'] = watches_grouped['song_id'].apply(lambda x: (x[-1]))

    model = get_model(model_path)

    """ Currently Not Accounting for Search Features """
    predict = model.predict([
        keras.preprocessing.sequence.pad_sequences(watches_grouped['song_id']),
        keras.preprocessing.sequence.pad_sequences(watches_grouped['song_id'])
    ])

    """ Get Top 150 Candidates (Other 50 will be the recently added and region based candidates)"""
    predictions = ([list((-a).argsort()[:150]) for a in predict])
    watches_grouped['predictions'] = predictions

    """ Get actual songs from indexes """

    def get_songs_from_ids(indexes):
        songs = []
        for index in indexes:
            songs.append(corpus['song'].get(index))
        return songs

    unix_timestamp = time.time()

    """ Loop over values and return human readable json """
    return list(({"unix_timestamp": unix_timestamp, "user_id": index_2_userid.get(row['user_id']),
                  "candidates": get_songs_from_ids(row['predictions'])}) for index, row in watches_grouped.iterrows())
