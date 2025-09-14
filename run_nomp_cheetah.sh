docker run --net host -d --name nomp -p 8546:8546 -v ${HOME}/.cheetahcoin3:/root/.cheetahcoin -v $(pwd)/config:/opt/config nomp-neng
