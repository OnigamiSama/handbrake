#!/bin/sh
#
TOUCH=touch
SRC=/data/mediaserver/Handbrake/RAW/
DEST=/data/mediaserver/Handbrake/Post/
DEST_EXT=mkv
HANDBRAKE_CLI=HandBrakeCLI
PRESET="H.265 MKV 1080p30"
IFS=$(echo -en "\n\b")
#
#
for FILE in `ls $SRC`
do
        filename=$(basename $FILE)
        extension=${filename##*.}
        filename=${filename%.*}
#
        $HANDBRAKE_CLI --all-audio --all-subtitles -i "$SRC/$FILE" -o "$DEST/$filename.$DEST_EXT" --preset="$PRESET"
        $TOUCH -r "$SRC/$FILE" "$DEST/$filename.$DEST_EXT"
        #rm -rf $SRC/$FILE
done
