import React, {lazy, Suspense} from "react";

const LazyStarRatingDialog = lazy(() => import("./StarRatingDialog"));

const StarRatingDialog = props => (
    <Suspense fallback={null}>
        <LazyStarRatingDialog {...props} />
    </Suspense>
);

export default StarRatingDialog;
