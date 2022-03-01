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
docker run --restart=always --detach --name=desinform_stop --pull=always -e SITE='https://cocky-hugle-0729da.netlify.app/' kuzmichm/desinform-stop
```

### Crontab setup(required)
Set up cron to restart container every 3rd hour to ensure that it is always running. This command will add new line to crontab.
```
(crontab -l && echo "0 */3 * * *  docker restart desinform_stop") | crontab -
```

## Notes
### Free cloud resources
Please note that this image was made to run it on Linux servers. Many cloud providers give some free credits for trial period. Please check this link:
1) https://cloud.google.com/free ( the most safe, you can forget about billing as you never go out from the credits)
New customers also get $300 in free credits to fully explore and conduct an assessment of Google Cloud Platform. You won’t be charged until you choose to upgrade. 

2) https://azure.microsoft.com/en-us/free/ ( check billing as additional charges can be if you go out of 200 USD)

## Pull requests are welcome
