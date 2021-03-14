import React, {lazy, Suspense} from 'react';

const LazyDiscover = lazy(() => import('./Discover'));

const Discover = props => (
    <Suspense fallback={null}>
        <LazyDiscover {...props} />
    </Suspense>
);

export default Discover;
