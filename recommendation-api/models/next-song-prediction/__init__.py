user_id = "request.args.get('user_id')"
# data = request.get_json()
# watches = pd.read_json(data['history']['watches'])
watches = pd.read_json(
    'https://hosted-kabeersnetwork.000webhostapp.com/yebr-music/tests/datasets/training-session-watches.json')
recommendations = []
candidates = pd.read_json(endpoints['candidates'])
watches.head()


@app.route("/feed/home/depecrated/knn/rank")
def _knn_ranker():
    user_id = request.args.get('user')
    recommendations = []
    response = []
    movies_response = requests.get(endpoints["getPlaylist"] + playLists["popHotList"])
    movies_json = movies_response.json()
    movies = pd.read_json(endpoints['candidates'] + user_id)
    history = requests.get(
        endpoints["getHistory"] + str(request.args.get('history_items')) if request.args.get('history_items') else
        endpoints["getHistory"]).json()

    for i in history:
        response.append(
            GetSimilarToMovie(i, int(request.args.get('for_each_history')), movies_response=movies_response,
                              movies_json=movies_json, movies=movies))

    response = flatten(response)

    for id in response:
        recommendations.append(requests.get(endpoints["getSongWithSchema"] + id).json())

    response = app.response_class(
        response=json.dumps({
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


