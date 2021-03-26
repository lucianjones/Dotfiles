#!/bin/bash
MUSIC_DIR=$HOME/Music
COVER="/tmp/album_cover.png"
COVER_SIZE="400"

#path to current song
album="$(mpc -p 6601 --format %album% current)"
file="$(mpc -p 6601 --format %file% current)"
album_dir="${file%/*}"
[[ -z "$album_dir" ]] && exit 1
album_dir="$MUSIC_DIR/$album_dir"

#search for cover image
art="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
if [ "$art" = "" ]; then
  art="$HOME/.config/ncmpcpp/default_cover.png"
fi
#copy and resize image to destination
ffmpeg -loglevel 0 -y -i "$art" -vf "scale=$COVER_SIZE:-1" "$COVER"
