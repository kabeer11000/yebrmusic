# from docutils.nodes import classifier
from flask import Flask, jsonify, request
from models.next_song_prediction import model as NP_Model
from models.next_song_prediction import retrain
from models.knn_classifier import model as KNN_MODEL
import pandas as pd
from os import environ

app = Flask(__name__)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True


@app.route('/next-song-prediction/get-all-predictions')
def generate_next_song_predictions():
    model_path = "./model-snapshots/next-song-prediction/model.h5"
    corpus_path = './dataset/indexed-songs/songs.pkl'
    res = jsonify(NP_Model.GenerateCandidates(model_path, corpus_path))
    res.headers.add("Access-Control-Allow-Origin", "*")
    return res, 200


@app.route("/feed/recommendations/deprecated/knn", methods=['POST'])
def _rank_candidates_with_knn():
    import json
    import math
    data = request.json
    total_items = int(data['total_items'])
    watches = pd.DataFrame(data['watches']).drop_duplicates(subset=['id', 'etag'])
    if len(watches) == 0:
        return jsonify("Cannot Make Predictions - No Watch History")

    n_items = math.floor((total_items / len(watches)))
    ranked = []
    response = []
    candidates = pd.DataFrame(data['candidates'])
    if len(candidates) == 0:
        return jsonify("Cannot Make Predictions - No Candidates")

    candidates = pd.concat([candidates, watches]).drop_duplicates(subset=['id', 'etag'])
    for index, row in watches.iterrows():
        ranked.append(KNN_MODEL.GetSimilarSongs(song=row, candidates=candidates, n_items=n_items))

    ranked = KNN_MODEL.flatten(ranked)
    candidates['json'] = candidates.to_json(orient='records', lines=True).splitlines()

    for i in ranked:
        song = candidates[candidates['id'] == i]
        if not song.empty:
            response.append(json.loads(song['json'].values[0]))

    res = jsonify(response)
    res.headers.add("Access-Control-Allow-Origin", "*")
    return res


@app.route('/next-song-prediction/retrain-model')
def re_train_next_song_model():
    try:
        model_path = "./model-snapshots/next-song-prediction/model.h5"
        corpus_path = './dataset/indexed-songs/songs.pkl'
        print("Model")
        retrain.ReTrainModel(corpus_path, model_path)
        res = jsonify("Model Retrained")
        res.headers.add("Access-Control-Allow-Origin", "*")
        return res, 200
        # return jsonify("Now Retraining - Please View the Server log for errors! - This will always return 200")
    except Exception as e:
        print(e)
        print("An Error Occurred")
        res = jsonify("An Error Occurred")
        res.headers.add("Access-Control-Allow-Origin", "*")
        return res, 500


if __name__ == "__main__":
    if environ.get('PORT'): app.run(port=environ.get('PORT'), debug=False)
    else: app.run(debug=False)
