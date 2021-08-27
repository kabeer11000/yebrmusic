import React, {lazy, Suspense} from "react";

const LazyTrendingArtists = lazy(() => import("./TrendingArtists"));

const TrendingArtists = props => (
    <Suspense fallback={null}>
        <LazyTrendingArtists {...props} />
    </Suspense>
);

export default TrendingArtists;
