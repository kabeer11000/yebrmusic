"""
1) Get video Details by id
2) Do TfIdf and Cosine Similarity and Save
3) Rank by video duration
4) Repeat for 10 user history and get 2 similar from each

"""

# import io

import json
# import logging
import requests
import numpy as np
import pandas as pd
# from urllib import parse, request
# import tmdbsimple as tmdb
from random import random
from sklearn.metrics.pairwise import linear_kernel, cosine_similarity
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
from youtube_search import YoutubeSearch
from flask_cors import CORS, cross_origin

from flask import Flask, request
from flask_caching import Cache

# import pymongo

# from nlp_rake import Rake

# db = pymongo.MongoClient("mongodb://localhost:27017/music")["music"]
app = Flask(__name__)

config = {
    "DEBUG": True,          # some Flask specific configs
    "CACHE_TYPE": "simple", # Flask-Caching related configs
    "CACHE_DEFAULT_TIMEOUT": 300
}
app.config.from_mapping(config)
cache = Cache(app)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'
endpoints = {
    "getSong": "http://localhost:9000/recom/video/",
    "searchSongs": "http://localhost:9000/recom/search/",
    "getPlaylist": "http://localhost:9000/recom/playlist/",
    "getPlaylists": "http://localhost:9000/recom/concat/playlist/",
    "getHistory": "http://localhost:9000/recom/history?len=",
    "getSongWithSchema": "http://localhost:9000/recom/schema/video/"
}
playLists = {
    "bollywoodHitList": "RDCLAK5uy_n9Fbdw7e6ap-98_A-8JYBmPv64v-Uaq1g",
    "popHotList": "RDCLAK5uy_nhf3h98yS3LCk_bVNQu6GjWG7ARvMaiFQ"
}


# Utility Functions
def combine_features(row, features):
    try:
        combined_data = ""
        for feature in features:
            combined_data += str(row[feature]) + " "
        return combined_data
    except Exception as e:
        return combined_data


def get_movie_from_index(df, index):
    return df[df.index == index].values[0]


class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        # print(obj)
        if isinstance(obj, np.integer):
            return int(obj)
        elif isinstance(obj, np.floating):
            return float(obj)
        elif isinstance(obj, np.ndarray):
            return obj.tolist()
        else:
            return super(NpEncoder, self).default(obj)


flatten = lambda t: [item for sublist in t for item in sublist]


# Will Not work because Read_JSON will not contain the video
def GetSimilarToMovie(movie, similar_movie_count, movies_response, movies_json, movies):
    # print(requests.get(endpoints["getSong"] + movie_id).content.decode('utf-8'))
    current_movie = pd.DataFrame([movie])
    # print(movies.head())
    # print(movies.columns)
    # print(current_movie.columns)
    # current_movie = pd.read_json(io.StringIO(requests.get(endpoints["getSong"] + movie_id).content.decode('utf-8')))
    if similar_movie_count > movies["id"].count():
        return "Error Count is More than Dataset. Try Lowering your Count"

    movies = pd.concat([movies, current_movie], ignore_index=True)
    movie_index = movies[movies.id == movie["id"]].index
    # if not movie_index:
    #     return "Error Movie Not Found"

    # ValueError: columns overlap but no suffix specified: Index(['title', 'id', 'runtime', 'channel'], dtype='object')

    features = ['title', 'runtime', 'channel', 'description']
    # for feature in features:
    #     movies[feature] = movies[feature].fillna('')
    movies['combined_features'] = movies.apply(combine_features, args=[features], axis=1)

    tfidf = TfidfVectorizer()
    tfidf_matrix = tfidf.fit_transform(movies['combined_features'])
    # print(tfidf_matrix.shape)

    cosine_similarity_scores = linear_kernel(tfidf_matrix, tfidf_matrix[movie_index])
    similar_movies = list(enumerate(cosine_similarity_scores))
    similar_movies = sorted(similar_movies, key=lambda x: x[1], reverse=True)
    similar_movies_response = []

    def find(movie_id):
        for _m in movies_json:
            if _m['id'] == movie_id:
                return _m

    # for i in range(1, similar_movie_count + 1):
    #     m = find(get_movie_from_index(movies, similar_movies[i][0])[1])
    #     if m:
    #         similar_movies_response.append(m)

    for i in range(similar_movie_count):
        similar_movies_response.append(get_movie_from_index(movies, similar_movies[i][0])[1])

    return similar_movies_response
    # return [a for a in movies_json if a['id'] == 'Pi2Gy7DG75g']
    # return [movies_json[a] for a in similar_movies_response]
    # return json.dumps(similar_movies_response, cls=NpEncoder)
    # return json.dumps(similar_movies_response)


def find_nearest(array, value):
    array = np.asarray(array)
    idx = (np.abs(array - value)).argmin()

    return idx


@app.route("/feed/home/recom")
@cross_origin()
def GetRecom():
    recommendations = []
    response = []
    movies_response = requests.get(endpoints["getPlaylist"] + playLists["popHotList"])
    movies_json = movies_response.json()
    movies = pd.read_json(movies_response.content.decode('utf-8'))
    history = requests.get(endpoints["getHistory"] + str(request.args.get('history_items')) if request.args.get('history_items') else endpoints["getHistory"]).json()

    for i in history:
        response.append(
            GetSimilarToMovie(i, int(request.args.get('for_each_history')), movies_response=movies_response, movies_json=movies_json, movies=movies))

    response = flatten(response)

    for id in response:
        recommendations.append(requests.get(endpoints["getSongWithSchema"] + id).json())

    response = app.response_class(
        response = json.dumps({
            "kind": "KabeersMusic#discoverListResponse",
            "etag": random(),
            "regionCode": "PK",
            "pageInfo": {
                "totalResults": len(recommendations),
            },
            "items": recommendations
    }, cls=NpEncoder),
        status=200,
        mimetype='application/json'
    )
    return response
    # return json.dumps(flatten(response), cls=NpEncoder)


if __name__ == '__main__':
    app.run()


# results = YoutubeSearch('QeRsc6pqdEM Soly0ne467M', max_results=10).to_json()
#
# print(results)

# returns a json string

########################################

# results = YoutubeSearch('search terms', max_results=10).to_dict()

# print(results)

# print(endpoints["getPlaylist"] + playLists["popHotList"])
# songs = GetRecom()

# print(songs)
# movies_json = requests.get(endpoints["getPlaylist"] + playLists["popHotList"]).json()
# print([a for a in movies_json if a['id'] == 'Pi2Gy7DG75g'])
