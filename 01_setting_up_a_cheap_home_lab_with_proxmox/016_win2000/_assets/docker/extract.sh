docker build -t 7z-docker .
docker rm -f 7z-docker || true
docker run -d -v /$(pwd):/7z --name 7z-docker 7z-docker

docker exec -it 7z-docker 7z e ./7z/*.7z -o./7z/ *.iso -r
