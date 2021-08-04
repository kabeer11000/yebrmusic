import React, {lazy, Suspense} from 'react';

const LazyAccountChooser = lazy(() => import('./AccountChooser'));

const AccountChooser = props => (
    <Suspense fallback={null}>
        <LazyAccountChooser {...props} />
    </Suspense>
);

export default AccountChooser;
