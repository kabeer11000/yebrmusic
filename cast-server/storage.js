// const state = {};
class Storage {
    state = {};

    insertOne(key, value) {
        this.state[key] = value;
        return value;
    }

    findOne(key) {
        return this.state[key];
    }

    deleteOne(key) {
        delete this.state[key];
    }

    updateOne(key, value) {
        this.state[key] = value;
        return value;
    }

    getStorage() {
        return this.state;
    }
}

module.exports = Storage
