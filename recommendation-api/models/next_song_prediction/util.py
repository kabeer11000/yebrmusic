from tensorflow import keras, function, math, reduce_sum, ragged, reduce_mean

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
