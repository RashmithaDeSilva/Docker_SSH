# Docker SSH

+ In this repo have two parts and there Docker imagers for ssh server and ssh client also ather part is if alredy you have conteners ucan use this ssh_client.sh or ssh_server.sh then it will install it

#### How to user Docker image

+ For server
~~~ Docker
docker build -t ssh_server -f Dockerfile .
~~~

+ For client
~~~ Docker
docker build -t ssh_client -f Dockerfile --target ubuntu_ssh_client . 
~~~
