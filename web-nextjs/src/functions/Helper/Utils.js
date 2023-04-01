export function RetryPromise(fn, retriesLeft = 5, interval = 1000) {
	return new Promise((resolve, reject) => {
		fn()
			.then(resolve)
			.catch((error) => {
				setTimeout(() => {
					if (retriesLeft === 1) {
						// reject('maximum retries exceeded');
						reject(error);
                        return;
                    }

                    // Passing on "reject" is the important part
                    RetryPromise(fn, retriesLeft - 1, interval).then(resolve, reject);
                }, interval);
            });
    });
}
export async function fetchWithTimeout(resource, options = {}) {
	const { timeout = 8000 } = options;

	const controller = new AbortController();
	const id = setTimeout(() => controller.abort(), timeout);
	const response = await fetch(resource, {
		...options,
		signal: controller.signal
	});
	clearTimeout(id);
	return response;
}
/**
 *
 * @param {string} string
 * @param {boolean} lower
 * @returns {string}
 */
export const capitalizeName = (string, lower) => (lower ? string?.toLowerCase() : string).replace(/(?:^|\s|['`‘’.-])[^\x00-\x60^\x7B-\xDF](?!(\s|$))/g, (a) => a.toUpperCase());

