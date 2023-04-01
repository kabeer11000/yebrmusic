import {comLinkWorker} from "./worker-export";

// window.__kn.music["custom-elements"]["worker-image"] = class WorkerImage extends HTMLImageElement {
//     constructor() {
//         super();
//         const BlobRevoker = async () => URL.revokeObjectURL(this.src) && this.removeEventListener("load", BlobRevoker);
//         comLinkWorker.utils.ImageLoader.load(this.getAttribute("src")).then(blob => this.src = URL.createObjectURL(blob));
//     }
// }
window.customElements.define("img", class WorkerImage extends HTMLImageElement {
    constructor() {
        super();
        const BlobRevoker = async () => URL.revokeObjectURL(this.src) && this.removeEventListener("load", BlobRevoker);
        comLinkWorker.utils.ImageLoader.load(this.getAttribute("src")).then(blob => this.src = URL.createObjectURL(blob));
    }
});
