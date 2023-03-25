import tensorflow as tf
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn.neighbors import KNeighborsClassifier
from sklearn.feature_selection import RFE
from sklearn.tree import DecisionTreeClassifier
from sklearn.pipeline import Pipeline
import pickle
pathdf = 'Stress-Lysis.csv'  # Path of the file
Yvar = 'Stress Level'  # Name of the variable Y to predict
aggtype = ['mean', 'std']

palette = 'flare'
seed = 49

test_size = 0.30  # % size of test

df = pd.read_csv(pathdf)
df = df.drop(['Humidity'],axis=1)
X_train, X_test, y_train, y_test = train_test_split(df.drop(
    Yvar, axis=1), df[Yvar], test_size=test_size, stratify=df[Yvar], random_state=seed)
knn = KNeighborsClassifier(n_neighbors=3)
knn.fit(X_train, y_train)

rfe = RFE(estimator=DecisionTreeClassifier(), n_features_to_select=2)
pipeline = Pipeline(steps=[('RFE', rfe), ('KNN', knn)])
pipeline.fit(X_train, y_train)

pickle.dump(rfe,open('model.pkl','wb'))
model = pickle.load(open('model.pkl','rb'))