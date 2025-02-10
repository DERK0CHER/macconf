#!/bin/bash
SPOTIFY_STATUS=$(osascript -e 'tell application "Spotify" to player state as string')
if [ "$SPOTIFY_STATUS" == "playing" ]; then
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track as string')
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track as string')
  echo "$TRACK - $ARTIST"
else
  echo "Spotify Paused"
fi
