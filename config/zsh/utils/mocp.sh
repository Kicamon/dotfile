have_music=$(find . -maxdepth 1 -type f | grep -E '.mp3|.flac' | wc -l)
if [[ ${have_music} -ne 0 ]]; then
  /usr/bin/mocp .
else
  /usr/bin/mocp ~/Music
fi
