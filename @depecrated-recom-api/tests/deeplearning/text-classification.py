# import tensorflow as tf
from tensorflow import keras

# import numpy as np

# import pandas as pd
# import matplotlib.pyplot as plt

dataset = keras.datasets.imdb
(train_data, train_labels), (test_data, test_labels) = dataset.load_data(num_words=90000)

word_index = dataset.get_word_index()
word_index = {k: (v + 3) for k, v in word_index.items()}  # Adding  3 to all word values so i can add my own words
word_index["<PAD>"] = 0
word_index["<START>"] = 1
word_index["<UNK>"] = 2
word_index["<UNUSED>"] = 3

# Prepossessing
train_data = keras.preprocessing.sequence.pad_sequences(train_data, value=word_index["<PAD>"], padding="post",
                                                        maxlen=224)
test_data = keras.preprocessing.sequence.pad_sequences(test_data, value=word_index["<PAD>"], padding="post", maxlen=224)

reverse_word_index = dict((value, key) for (key, value) in word_index.items())  # Map Index to word not word to index


def decode_review(text):
    return " ".join(
        [reverse_word_index.get(i, "?") for i in text])  # Join kar kay print karay ga 1 dimentional array say


def encode_review(s):
    encoded = [1]
    for word in s:
        if word.lower() in word_index:
            encoded.append(word_index[word.lower()])
        else:
            encoded.append(2)  # Unknown Tag
    return encoded


# Model
model = keras.Sequential([
    keras.layers.Embedding(90000 + 1, 16),
    keras.layers.Dropout(0.2),
    keras.layers.GlobalAveragePooling1D(),
    keras.layers.Dropout(0.2),
    keras.layers.Dense(1)
])
model.compile(optimizer="adam", loss="binary_crossentropy", metrics=["accuracy"])
model.save("models/text-classify.h5")
x_val = train_data[:10000]  # GET only 10000 from 25000
x_train = train_data[10000:]

y_val = train_labels[:10000]
y_train = train_labels[10000:]

# model.fit(x_train, y_train, epochs=15, batch_size=512, validation_data=(x_val, y_val), verbose=1)
# results = model.evaluate(test_data, test_labels)

# 0.8443999886512756
# DropOut Layer
# 0.8444799780845642
classes = ["Negative", "Positive"]

# my_review = "<START> Bad film i hate it <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD> <PAD>"
my_review = "Bad film i hate it"
# test_review = test_data[0]
test_review = encode_review(my_review)
predicted = model.predict([test_review])
print("Review: " + decode_review(test_review))
print("Predicted: " + str(classes[int(predicted[0][0])]))
print("Actual: " + str(classes[0]))

# for i in (range(len(prediction)), range(5))[len(prediction) > 5]:
#     plt.grid(False)
#     plt.imshow(test_images[i])
#     plt.xlabel("Actual: " + class_names[test_labels[i]])
#     plt.title("Prediction: " + class_names[np.argmax(prediction[i])])
#     plt.show()
"""
## DOCS


---binary_crossentropy
binary function for classifying loss




Val = validation data 
"""
