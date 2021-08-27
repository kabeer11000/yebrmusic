import React, {lazy, Suspense} from "react";

const LazySongCard2 = lazy(() => import("./SongCard2"));

const SongCard2 = props => (
    <Suspense fallback={null}>
        <LazySongCard2 {...props} />
    </Suspense>
);

export default SongCard2;
