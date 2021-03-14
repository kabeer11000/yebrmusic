import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn import linear_model, preprocessing, model_selection

# from sklearn.utils import shuffle
# import numpy as np


data = pd.read_csv("../datasets/Car-Data-Set/car.csv")

encoder = preprocessing.LabelEncoder()
buying = encoder.fit_transform(list(data["buying"]))
maint = encoder.fit_transform(list(data["maint"]))
door = encoder.fit_transform(list(data["door"]))
persons = encoder.fit_transform(list(data["persons"]))
lug_boot = encoder.fit_transform(list(data["lug_boot"]))
safety = encoder.fit_transform(list(data["safety"]))
cls = encoder.fit_transform(list(data["class"]))

predict = "class"

X = list(zip(buying, maint, door, persons, lug_boot, safety))
y = list(cls)

X_train, X_test, y_train, y_test = model_selection.train_test_split(X, y, test_size=0.1)
classifier = KNeighborsClassifier(n_neighbors=9)
classifier.fit(X_train, y_train)
print(classifier.score(X_test, y_test))
predicted = classifier.predict(X_test)
names = ["unaac", "acc", "good", "vgood"]
for x in range(len(predicted)):
    print("Predicted: ", names[predicted[x]], "Data: ", X_test[x], "Actual: ", names[y_test[x]])
    # print(classifier.kneighbors([X_test[x]], 9))

