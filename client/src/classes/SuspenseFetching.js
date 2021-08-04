export class BaseResource {
    data = undefined;
    status = "pending";
    error = undefined;
    promise = null;

    read() {
        switch (this.status) {
            case "pending":
                throw this.promise;
            case "error":
                throw this.error;
            default:
                return this.data;
        }
    }
}

export class AsyncResource extends BaseResource {
    constructor(promise) {
        super();
        this.promise = promise.then((data) => {
            this.status = "success";
            this.data = data;
        }).catch((error) => {
            this.status = "error";
            this.error = error;
        });
    }
}
