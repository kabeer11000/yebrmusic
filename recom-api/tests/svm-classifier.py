import pandas as pd
from sklearn import datasets
from sklearn import svm
from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.neighbors import KNeighborsClassifier
cancer = datasets.load_breast_cancer()

X = cancer.data
y = cancer.target

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

classes = ["malignant", "benign"]
classifier = svm.SVC(kernel="linear", C=2)
# classifier = KNeighborsClassifier(n_neighbors=20)
classifier.fit(X_train, y_train)
prediction = classifier.predict(X_test)

print(classifier.score(X_test, y_test))
print(metrics.accuracy_score(y_test, prediction))
