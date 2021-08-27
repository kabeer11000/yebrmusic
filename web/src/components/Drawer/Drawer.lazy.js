import React, {lazy, Suspense} from "react";
import Preloader from "../Preloader/Preloader";

const LazyDrawer = lazy(() => import("./Drawer"));

const Drawer = props => (
	<Suspense fallback={<Preloader/>}>
		<LazyDrawer {...props} />
	</Suspense>
);

export default Drawer;
