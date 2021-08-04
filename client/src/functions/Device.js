import {storageIndex} from "./Helper/StorageIndex";
import {Cookies} from "./Cookies";

export const Device = {
    getId: () => {
        const deviceId = Cookies.getCookie(storageIndex.cookies.deviceID);
        if (!deviceId) throw new Error("Device Id Not Found");
        return deviceId
    }
}
