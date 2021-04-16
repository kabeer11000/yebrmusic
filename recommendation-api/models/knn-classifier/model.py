import pandas as pd
from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer
from flask import Flask, jsonify, request

app = Flask(__name__)

endpoints = {
    "candidates": "http://localhost:9000/recommendation/backend/get-candidates?user_id=",
    "getSong": "http://localhost:9000/recommendation/video/",
    "searchSongs": "http://localhost:9000/recommendation/search/",
    "getPlaylist": "http://localhost:9000/recommendation/playlist/",
    "getPlaylists": "http://localhost:9000/recommendation/concat/playlist/",
    "getHistory": "http://localhost:9000/recommendation/history?len=",
    "getSongWithSchema": "http://localhost:9000/recommendation/schema/video/"
}


def combine_features(row):
    c = ""
    try:
        row = row['snippet']
        c = str(row['title'] + row['description'] + row['channelTitle'])
        return c
    except:
        return c


def get_song_from_index(df, index):
    return df[df.index == index]['id'].item()


flatten = lambda t: [item for sublist in t for item in sublist]


def GetSimilarSongs(song, candidates, n_items):
    # current_song = pd.DataFrame([song])

    if n_items > candidates["id"].count():
        return "Error Count is More than Candidates. Try Lowering your Count"

    # candidates = pd.concat([candidates, current_song], ignore_index=True)
    song_index = candidates[candidates['id'] == song["id"]].index
    candidates['combined_features'] = candidates.apply(combine_features, axis=1)

    tfidf = TfidfVectorizer()
    tfidf_matrix = tfidf.fit_transform(candidates['combined_features'])

    cosine_similarity_scores = linear_kernel(tfidf_matrix, tfidf_matrix[song_index])

    similar_candidates = list(enumerate(cosine_similarity_scores))
    similar_candidates = sorted(similar_candidates, key=lambda x: x[1][0], reverse=True)

    similar_candidates_response = []

    for i in range(n_items):
        similar_candidates_response.append(get_song_from_index(candidates, similar_candidates[i][0]))

    return similar_candidates_response.reverse()


@app.route("/feed/recommendations/deprecated/knn", methods=['POST'])
def _rank_candidates_with_knn():
    data = request.json
    watches = pd.read_json(data['watches'])
    ranked = []
    response = []
    candidates = pd.read_json(data['candidates'])

    for index, row in watches.iterrows():
        ranked.append(GetSimilarSongs(song=row, candidates=candidates, n_items=3))

    ranked = flatten(ranked)
    candidates['json'] = candidates.to_json(orient='records', lines=True).splitlines()

    for i in ranked:
        song = candidates[candidates['id'] == i]
        if not song.empty:
            response.append(song['json'].item())

    return jsonify(response)


if __name__ == '__main__':
    app.run(debug=True)
# 'https://hosted-kabeersnetwork.000webhostapp.com/yebr-music/tests/datasets/depecrated/knn-ranking/session-watches.json'
