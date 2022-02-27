# docker-stop-sites

To stop russion desinformation on servers using simple docker run 

## Usage
```
sudo docker run --restart=always  --detach kuzmichm/desinform-stop

# it is recommented to set memery limit to prevent OOM issue (set it based on your server size)
sudo docker run --restart=always --memory=4Gi --detach kuzmichm/desinform-stop 
```

## Pull requests are welcome
