// import {CastAfterAuthFunctions} from "./Cast/Cast";

import endPoints from "../api/endpoints/endpoints";

export const AfterAuthFunction = async () => {
    // alert("After Auth Functions")
    window["__kn"]["music"]["data-collection"].token = await fetch(endPoints.DataCollection.getToken()).then(a => a.json());
    // await CastAfterAuthFunctions();
};
