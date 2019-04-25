### Strace Container

A simple Docker Image to monitor the pid of a running container via strace.

Inspired by: sjourdan/strace-docker

#### Build Image

Clone this repo and enter the directory:

`docker build -t strace . `

#### Simple Output

To Run strace with output directly to the Docker Logs:

```
docker run -d \
--name=strace \
--pid=container:{NAME} \
--net=container:{NAME} \
--cap-add sys_admin \
--cap-add sys_ptrace \
-e PID={PID} \
strace
```

- Replace {NAME} with the name of the Container you are monitoring.
- Replace {PID} with the pid that you would like to monitor in that container.

Then Follow the logs:

`docker logs -f strace`

#### Output to File

To output to a file use the FILE environment variable.

It's also recommended to bind a local directory to the container so that you can easily access this file:


```
docker run -d \
--name=strace \
--pid=container:{NAME} \
--net=container:{NAME} \
--cap-add sys_admin \
--cap-add sys_ptrace \
-e PID={PID} \
-e FILE={FILE}
-v /LOCAL/PATH:/strace/output:rw
strace
```
- Replace {NAME} with the name of the Container you are monitoring.
- Replace {PID} with the pid that you would like to monitor in that container.
- Replace {FILE} with the desired filename for the output
- Replace /LOCAL/PATH with the path on your machine you would like the output stored to.

You can then view the output from your host at /LOCAL/PATH/FILE

#### Possible Issues

If there is a large amount of data - stopping the container using `docker stop` may take a while. It is recommended to instead find the pid of containers command and kill it:

```
ps -ef | grep strace
root     18136 18108  0 10:57 ?        00:00:00 strace -f -p 758
sudo kill -9 18136
```
