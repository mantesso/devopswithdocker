1) setup a VPS on hetzner.com with Ubuntu 24.04
2) Added my local machine SSH keys
3) ssh to the server: `ssh root@128.140.114.85`
4) updated linux `sudo apt update && sudo apt upgrade -y`
5) installed docker following instructions from `https://docs.docker.com/engine/install/ubuntu/`
6) pulled my image from last exercise: `docker pull mantesso/odin-battleship`
7) ran the image but with port 80 on the host machine so it's accessible on the internet: `docker run -p 80:3000 mantesso/odin-battleship`
8) confirmed it's working on the browser by accessing: `http://128.140.114.85/`