import pandas as pd
from sklearn.metrics import pairwise
from sklearn.feature_extraction.text import TfidfVectorizer


""" Utility Functions """


def combine_features(row):
    row = row['snippet']
    return row['title']


def get_song_from_index(df, index):
    return df[df.index == index].index.item()


flatten = lambda t: [item for sublist in t for item in sublist]


def get_data(candidates, watch_history):
    candidates = pd.DataFrame(candidates)
    watch_history = pd.DataFrame(watch_history)

    candidates = candidates.drop(['etag'], axis=1)
    watch_history = watch_history.dropna(axis=1)

    candidates = pd.concat([candidates, watch_history], ignore_index=True).drop_duplicates(subset=['id']).dropna(axis=1)

    candidates['combined_features'] = candidates.apply(combine_features, axis=1)

    return candidates, watch_history


def get_similar(index, candidates, n_items):
    if n_items > candidates["id"].count():
        return "Error Count is More than Candidates. Try Lowering your Count"

    tfidf = TfidfVectorizer()
    tfidf_matrix = tfidf.fit_transform(candidates['combined_features'])

    cosine_similarity_scores = pairwise.linear_kernel(tfidf_matrix, tfidf_matrix[index])

    similar_candidates = list(enumerate(cosine_similarity_scores))
    similar_candidates = sorted(similar_candidates, key=lambda x: x[1],
                                reverse=True)  # Sort by Cosine Similarity (index, value) enumerate object

    return list(map(lambda x: x[0], similar_candidates[:n_items]))

