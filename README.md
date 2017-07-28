# aerospike-client-java.docker

What's next? 
Clone the repo:

git clone https://github.com/volmarl/aerospike-client-java.docker.git

Build Docker image:

docker build -t as_java .

Run docker container:

docker run -ti --name as_java_client as_java 

cd to Client directory:

cd aerospike-client-java-x.y.z


Try running the examples:

cd aerospike-client-java-4.0.6/examples/

Run PUT and GET example:

./run_examples PutGet

Run all the examples:

./run_examples all

Run benchmarks:

cd aerospike-client-java-4.0.6/benchmarks/

./run_benchmarks -h <IP of container> -p 3000 -n test -k 100000000 -l 30 -S 1 -o S:50 -w RU,10 -z 20
