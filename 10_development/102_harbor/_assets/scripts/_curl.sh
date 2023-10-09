#!/bin/bash

var_filename=$1

if [ -z $var_filename ]
then
  echo Please provide a file number:
  read var_filename
fi

curl -sb POST https://texttospeech.googleapis.com/v1/text:synthesize?key=$TF_VAR_GOOGLE_TEXTTOSPEECH_API_KEY \
-H "Content-Type: application/json" \
-d @./$var_filename.json > ./$var_filename.txt

jq -r '.audioContent' ./$var_filename.txt > ./$var_filename.raw
rm -f ./$var_filename.txt

base64 ./$var_filename.raw -di > ./$var_filename.wav
rm -f ./$var_filename.raw

ffmpeg -i ./$var_filename.wav -af asetrate=44100*1.2,aresample=44100,atempo=1/1.2 -ac 2 ../sounds/$var_filename.wav -y 
rm -f ./$var_filename.wav

