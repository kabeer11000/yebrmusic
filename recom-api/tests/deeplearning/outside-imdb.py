from tensorflow import keras

file_path = "./test-classification.txt"

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


model = keras.models.load_model("./models/text-classify.h5")


def review_encode(s):
    encoded = [1]
    for word in s:
        if word.lower() in word_index:
            encoded.append(word_index[word.lower()])
        else:
            encoded.append(2)  # Unknown Tag
    return encoded


# Making Word Index
with open(file_path, encoding="utf-8") as f:
    for line in f.readlines():
        n = line.replace(",", "").replace(".", "").replace("(", "").replace(")", "").replace(":", "").replace("\"",
                                                                                                              "").strip().split(
            " ")
        encode = review_encode(n)
        print(n)
        print(encode)
        # encode = keras.preprocessing.sequence.pad_sequences([encode], value=word_index["<PAD>"], padding="post",
        #                                                     maxlen=224)
        # predict = model.predict(encode)
        # print(n)
        # print(encode)
        # print(predict[0])
