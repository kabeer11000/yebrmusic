# import tensorflow as tf
from tensorflow import keras
import numpy as np
# import pandas as pd
import matplotlib.pyplot as plt

dataset = keras.datasets.fashion_mnist
(train_images, train_labels), (test_images, test_labels) = dataset.load_data()
class_names = ['T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat', 'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot']
train_images = train_images / 255.0
test_images = test_images / 255.0


def custom_activation(x):
    print(x)
    return np.argmax(x)


model = keras.Sequential([
    keras.layers.Flatten(input_shape=(28, 28)),  # images 28 x 28 hai
    keras.layers.Dense(128, activation="relu"),
    keras.layers.Dense(128, activation="relu"),
    keras.layers.Dense(10, activation="softmax"),  # Softmax Layer Total 1 kardayga aur Probbality check karay ga
    # keras.layers.Dense(1, activation=custom_activation),
])
model.compile(optimizer="adam", loss="sparse_categorical_crossentropy", metrics=["accuracy"])
# keras.utils.plot_model(model, to_file='./model-png', show_shapes=True)
model.fit(train_images, train_labels, epochs=5, batch_size=200)
# print(model.evaluate(test_images, test_labels)) #, batch_size=2
prediction = model.predict(test_images)  # Takes 2 dimentional data
# print(len(test_images))
for i in (range(len(prediction)), range(5))[len(prediction) > 5]:
    plt.grid(False)
    plt.imshow(test_images[i])
    plt.xlabel("Actual: " + class_names[test_labels[i]])
    plt.title("Prediction: " + class_names[np.argmax(prediction[i])])
    plt.show()
"""
DOCS 

-- train_images / 255.0
refered in ...  train_images = train_images / 255.0
reduce the numbers in the image array so MY computer can process it faster but no effect really


forpredicting one image  
prediction = model.predict([test_images[index]) # Takes 2 dimentional data



-- np.argmax
refered in ... plt.title("Prediction: " + class_names[np.argmax(prediction[i])])
this basically pics highest value from an array of numbers which the model predicts [ End Output layer ]


-- sparse_categorical_crossentropy
Computes the crossentropy loss between the labels and predictions.

Use this crossentropy loss function when there are two or more label classes. We expect labels to be provided as ::::integers::::. If you want to provide labels using one-hot representation, please use CategoricalCrossentropy loss. There should be # classes floating point values per feature for y_pred and a single floating point value per feature for y_true.

In the snippet below, there is a single floating point value per example for y_true and # classes floating pointing values per example for y_pred. The shape of y_true is [batch_size] and the shape of y_pred is [batch_size, num_classes].














[[128, 5, 2], [12, 5 ,9], 65].flatten()
[128, 5, 2, 12, 5 ,9, 65]

[[128, 5, 2], [12, 5 ,9]]
=> [[128, 5, 2]]

np.expand_dims(test_images[7], 0)
[test_images[7]]
"""
