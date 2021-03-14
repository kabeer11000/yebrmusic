import React, {lazy, Suspense} from 'react';

const LazySongListItem = lazy(() => import('./SongListItem'));

const SongListItem = props => (
    <Suspense fallback={null}>
        <LazySongListItem {...props} />
    </Suspense>
);

export default SongListItem;
