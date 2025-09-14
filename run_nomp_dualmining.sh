docker run --net host -d --name nomp -p 8546:8546 -v ${HOME}/.cheetahcoin3:/root/.cheetahcoin -p 8388:8388 -v ${HOME}/.nengcoin3:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
