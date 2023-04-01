class WorkerImage extends HTMLImageElement {
    constructor() {
        super();
        this.onload = async () => {
            window.__kn.music.workers.image_loader.postMessage(this.getAttribute("worker-src"));
        }
    }
}
