#docker network create slc
registry=
docker run -d --name zk01 --net slc -e MYID=1 -e ENSEMBLE=0.0.0.0 -v $PWD/scratch/data/zk01:/data -v $PWD/scratch/log/zk01:/log -p 2181 $registry/elqzookeeper:3.4.8
