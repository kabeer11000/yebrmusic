from tensorflow import keras
import pandas as pd
from tensorflow import reduce_sum, ragged, function, math, reduce_mean
# from datetime import datetime
import time


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


def GenerateCandidates(model_path, indexed_songs_file_name):
    # indexed_songs_file_name = '../../dataset/indexed-songs/songs.pkl'
    corpus = pd.read_pickle(indexed_songs_file_name)
    user_watch_history = pd.read_json(
        "http://localhost/api/history/get-history")  # "./dataset/training-get-history.json"
    user_search_history = pd.read_json("http://localhost:9000/recom/history/search")  # "./dataset/training-search.json"

    song_ids = corpus["song_id"].unique().tolist()
    song_2_index = {x: i for i, x in enumerate(song_ids)}
    index_2_songid = {i: x for i, x in enumerate(song_ids)}

    user_ids = user_watch_history["user_id"].unique().tolist()
    user_2_index = {x: i for i, x in enumerate(user_ids)}
    index_2_userid = {i: x for i, x in enumerate(user_ids)}

    user_watch_history['user_id_encoded'] = user_watch_history['user_id'].map(user_2_index)
    user_watch_history['song_id_encoded'] = user_watch_history['song_id'].map(song_2_index)

    user_watched_group = user_watch_history.groupby(['user_id_encoded'])['song_id_encoded'].apply(list).reset_index()
    user_search_group = user_search_history.groupby(['user_id'])['query'].apply(list).reset_index()
    user_watched_group['past_predicted'] = user_watched_group['song_id_encoded'].apply(lambda x: (x[-1]))

    # filepath = "../../model-snapshots/next-song-prediction/model.h5"
    model = keras.models.load_model(model_path, custom_objects={
        'L2NormLayer': L2NormLayer,
        'MaskedEmbeddingsAggregatorLayer': MaskedEmbeddingsAggregatorLayer
    })
    predict = model.predict([
        keras.preprocessing.sequence.pad_sequences(user_watched_group['song_id_encoded']),
        keras.preprocessing.sequence.pad_sequences(user_watched_group['song_id_encoded']),
        # Not Adding Search Features Currently
    ])

    """### Map Softmax Results to Song Id's
    Predictions for user at index ```0```
    This Example only gets top 10 from n length dataset
    """

    predictions = ([list((-a).argsort()[:200]) for a in predict])
    user_watched_group['new_predictions'] = predictions
    user_watched_group.head()

    """### Get Actual Song Id's from Index"""

    songs_predicted_encoded = user_watched_group['new_predictions'][0]

    response = pd.concat([user_watch_history, user_watched_group], axis=1, join="inner")
    response = response.drop(
        ['song_id', 'song', 'rating', 'user_id_encoded', 'song_id_encoded', 'user_id_encoded', 'song_id_encoded',
         'past_predicted'], axis=1)

    def _get_song(x):
        # print(corpus['song_id'].loc(index_2_songid.get(x)))
        item = corpus.loc[corpus['song_id'] == index_2_songid.get(x)]
        return item['song'].item()
        # return corpus[corpus['song_id'] == index_2_songid.get(x)]['song'].values[0]

    response['predictions'] = response['new_predictions'].apply(lambda lst: list(map(_get_song, lst)))
    response = response.drop(['new_predictions'], axis=1)

    # r = {}
    # for index, row in response.iterrows():
    #     r[row['user_id']] = row['predictions']  # [i for i in row['predictions']]

    # timestamp = datetime.utcnow().strftime("%s")
    # using time module
    # import time

    # ts stores the time in seconds
    ts = time.time()

    return list(({"user_id": row['user_id'], "candidates": row['predictions'], "unix_timestamp": ts}) for index, row in response.iterrows())

    # users = {}
    # for row in songs_predicted_encoded:
    #     users[index_2_userid.get(row['user_id_encoded'])]
    # songs_predicted = []
    # for i in songs_predicted_encoded:
    #     if index_2_songid.get(i):
    #         songs_predicted.append(index_2_songid[i])
    #
    # print(user_watch_history, songs_predicted)


def _GenerateCandidates():
    # Save To Database
    return GenerateCandidates()


if __name__ == '__main__':
    print(GenerateCandidates())
