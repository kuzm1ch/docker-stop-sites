# docker-stop-sites

To stop russion desinformation on servers using simple docker run 

## Docker install for Ubuntu
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groupadd docker
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
# in case of error run this command twice
(crontab -l && echo "0 */3 * * *  docker restart desinform_stop") | crontab -
# verify crontab
crontab -l
```

## Notes
### Free cloud resources
This docker image was made to run it on Linux servers. 
Please note that many cloud providers give some free resources for trial period. Please check this links:
1) https://cloud.google.com/free - option one, the most safe
New customers also get $300 in free credits to fully explore and conduct an assessment of Google Cloud Platform. You won’t be charged until you choose to upgrade. 

2) https://azure.microsoft.com/en-us/free/ -  second option, check billing as additional charges can be after you use 200$ Azure credits

## Pull requests are welcome
