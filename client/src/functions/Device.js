import {storageIndex as S} from "./Helper/StorageIndex";

export const Device = {
    getId: () => {
        const deviceId = localStorage.getItem(S.deviceEtag);
        if (!deviceId) throw new Error("Device Id Not Found");
        return deviceId
    }
}
