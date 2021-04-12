import {useEffect, useState} from "react";

export const useNetwork = () => {
	const [isOnline, setNetwork] = useState(window.navigator.onLine);
	const updateNetwork = () => {
		setNetwork(window.navigator.onLine);
	};
	useEffect(() => {
		window.addEventListener("offline", updateNetwork);
		window.addEventListener("online", updateNetwork);
		return () => {
			window.removeEventListener("offline", updateNetwork);
			window.removeEventListener("online", updateNetwork);
		};
	});
	return isOnline;
};

export const _useInterval = (interval) => {
	const [state, setState] = useState(0);
	setInterval(() => setState(state + 1), interval);
	return state;
}

export const useInterval = (handler, delay, immediate = true) => {
	useEffect(() => {
		let interval

		const start = () => {
			clearInterval(interval)
			interval = setInterval(() => handler(start), delay)
		}

		handler(start)

		return () => clearInterval(interval)
	}, []);
}
