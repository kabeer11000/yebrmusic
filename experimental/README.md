# Yebr Experimental

These services are experimental, we are still developing them or testing them out.

### `audio-fingerprinting`

We are testing out dejavu. which fingerprints audio files and saves them into a SQL database
(In the future we will be using a embedding search algorithm and a Approximate nearest neighbour algorighim to find if
two songs are the same. )
This will help Yebr find song metadata from other platforms only by scraping audio from websites.

Fingerprinting will also help us to make a intelligent search where. users will be able to hum aur (shazam) to search
for songs.

### `source-seperation`

We are testing out deezer spleeter. a pretrained tensorflow model which can split audio sources into vocals and music.
this will help us extract vocals and eliminate noise, so we can run a speech recognition model to generate lyrics. we
are looking forward to using Mozilla DeepSpeech for speech recognition.

Split will also allow Yebr to better understand the audio. e.g. whether it's a podcast or a song.

### `lyrics`

For generating lyrics we are working with the idea of using split vocals and running a deep learning based speech
recognition model. we are testing out Mozilla Deep Speech for speech recognition.

Another thing we're working on are making Yebr automatically find lyrics to a particular audio without depending on a
single service.


---
Copyright (2020 - Present) - Kabeer's Network LLC and other open-source contributors. All Rights Reserved.
