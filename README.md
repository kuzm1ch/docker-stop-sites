# docker-stop-sites

To stop russion desinformation on servers using simple docker run 

## Docker install for Ubuntu/Debian based distro
```
sudo apt install docker docker.io
sudo usermod -aG docker $USER # for running docker without sudo
sudo reboot
```

## Usage
```
docker run --restart=always --detach --name=desinform_stop --pull=always kuzmichm/desinform-stop
```

where:

`--restart=always` - run after reboot

`--detach` - run in separate process

` --name=desinform_stop` - assign a name to the container

` --pull=always` - pull image before running

### Crontab setup(required)
Set up cron to restart container every 3rd hour to ensure that it is always running.
```
(crontab -l && echo "0 */3 * * *  docker restart desinform_stop") | crontab -
```
This command will add new line to crontab.

## Pull requests are welcome
