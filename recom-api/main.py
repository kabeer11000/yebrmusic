# import sklearn
import pandas as pd

dataset = pd.read_json("./datasets/watchHistory.json")[["user_id", "video_id"]]

print(dataset.groupby(["user_id", "video_id"]).size().reset_index(name="stars"))
