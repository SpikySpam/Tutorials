#!/bin/bash

# 💥 This script will work only in the current directory

mapfile -t PARAGRAPHS < <(grep -v '^$' "./_script.txt")

LINE=$1
INDEX=1
for PARAGRAPH in "${PARAGRAPHS[@]}"; do
  TEMPLATE=$(cat <<EOF
{
  "audioConfig": {
    "audioEncoding": "LINEAR16",
    "effectsProfileId": [
      "large-home-entertainment-class-device"
    ],
    "sampleRateHertz": 44100,
    "pitch": 0.0,
    "speakingRate": 1.0
  },
  "voice": {
    "languageCode": "en-US",
    "name": "en-US-Studio-M"
  },
  "input": {
    "text": "$PARAGRAPH"
  }
}
EOF
)

  NUMBER=$(printf "%02d" $INDEX)
  echo $TEMPLATE > ./$NUMBER.json

  if [ -z $LINE ]; then
    ./_curl.sh $NUMBER
  else
    if [ $INDEX -eq $LINE ]; then
     ./_curl.sh $NUMBER
    fi
  fi

  ((INDEX++))
done