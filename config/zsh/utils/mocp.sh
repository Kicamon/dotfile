have_music=$(find . -maxdepth 1 -type f -name '*.mp3' -o -name '*.flac' -o -name '*.wav' | wc -l)
if [[ ${have_music} -ne 0 ]]; then
  /usr/bin/mocp .
else
  /usr/bin/mocp ~/Music
fi
