docker run --rm --net host -d --name nomp -p 8376:8376 -v ${HOME}/.nengcoin3:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
