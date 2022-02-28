# docker-stop-sites

To stop russion desinformation on servers using simple docker run 

## Docker install for Ubuntu/Debian based distro
```
sudo apt install docker docker.io
sudo usermod -aG docker $USER # for running docker without sudo
```

## Usage
```
docker run --restart=always --detach kuzmichm/desinform-stop
```
or
```
# it is recommented to set memery limit to prevent OOM issue (set it based on your server size)
docker run --restart=always --memory=4Gi --detach kuzmichm/desinform-stop 
```
where:

`--restart=always` - run after reboot

`--detach` - run in separate process

`--memory=4Gi` - memory limit/bound

## Pull requests are welcome
