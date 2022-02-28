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

By default config source site is https://stop-russian-desinformation.near.page/, but in case you want to use another site, set it as ENV variable.
```
docker run --restart=always --detach --name=desinform_stop --pull=always kuzmichm/desinform-stop -e SITE='https://cocky-hugle-0729da.netlify.app/'
```

### Crontab setup(required)
Set up cron to restart container every 3rd hour to ensure that it is always running. This command will add new line to crontab.
```
(crontab -l && echo "0 */3 * * *  docker restart desinform_stop") | crontab -
```

## Pull requests are welcome
