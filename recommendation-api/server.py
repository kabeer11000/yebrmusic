# from docutils.nodes import classifier
"""
Heads up - This code is really crappy i have my GCSE in 20 days gotta study i promise it will be better and with docs once they end!
"""
from flask import Flask, jsonify, request
from models.next_song_prediction import model as np_model
from models.next_song_prediction import retrain
from models.knn_classifier import model as tfidf_model
from dotenv import load_dotenv

""" Load .env File """
load_dotenv()
from os import environ

app = Flask(__name__)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True


@app.route('/next-song-prediction/get-all-predictions')
def generate_next_song_predictions():
    model_path = "./model-snapshots/next-song-prediction/model.h5"
    corpus_path = './dataset/indexed-songs/songs.pkl'
    res = jsonify(np_model.generate_candidates(model_path, corpus_path))
    res.headers.add("Access-Control-Allow-Origin", "*")
    return res, 200


@app.route("/feed/recommendations/deprecated/knn", methods=['POST'])
def _rank_candidates_with_knn():
    import math
    candidates, watch_history = tfidf_model.get_data(request.json['candidates'], request.json['watches'])

    ranked = []
    response = []
    n_items = math.floor((40 / len(watch_history)))
    for index, row in watch_history.iterrows():
        ranked.append(
            tfidf_model.get_similar(index=index, candidates=candidates, n_items=n_items)[1:])  # Leave the first one

    ranked = list(set(tfidf_model.flatten(ranked)))
    candidates = candidates.drop(['combined_features'], axis=1)
    candidates['json'] = candidates.to_dict(orient='records')

    for i in ranked:
        response.append(candidates['json'].iloc[i])

    res = jsonify(response)
    res.headers.add("Access-Control-Allow-Origin", "*")
    return res


@app.route('/next-song-prediction/retrain-model')
def re_train_next_song_model():
    try:
        model_path = "./model-snapshots/next-song-prediction/model.h5"
        corpus_path = './dataset/indexed-songs/songs.pkl'
        print("Model")
        retrain.retrain_model(corpus_path, model_path)
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
    if environ.get('PROD'):
        from waitress import serve

        port = int(environ.get('PORT', 5000))
        serve(app, host="0.0.0.0", port=int(port))
    # if environ.get('PORT'): app.run(port=environ.get('PORT'), debug=False)
    else:
        app.run(debug=False)
