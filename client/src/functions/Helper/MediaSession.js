/**
 * @name AddMediaSession
 * @description:
 * Adds Song Object MediaSession
 *
 * @param {object} data - Song Object
 * @param {object} playPause - Play and Pause Function Object
 * @param {object} audio - DOM Audio Element
 *
 * @returns {null}
 * */
export const AddMediaSession = async (data, playPause, audio) => {
    if ("mediaSession" in navigator) {
        navigator.mediaSession.metadata = new window.MediaMetadata({
            title: data.title,
            artist: data.artist,
            album: data.album,
            artwork: data.artwork
        });
        navigator.mediaSession["setActionHandler"]("play", playPause.playAudio);
        navigator.mediaSession["setActionHandler"]("pause", playPause.pauseAudio);

        const skipTime = 10;
        const handleSeek = (details) => {
            switch (details.action) {
                case "seekforward":
                    audio.currentTime = Math.min(audio.currentTime + skipTime,
                        audio.duration);
                    break;
                case "seekbackward":
                    audio.currentTime = Math.max(audio.currentTime - skipTime, 0);
                    break;
            }
        }
        navigator.mediaSession["setActionHandler"]("seekforward", handleSeek);
        navigator.mediaSession["setActionHandler"]("seekbackward", handleSeek);

    }
}
