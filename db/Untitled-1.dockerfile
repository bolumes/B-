 wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -



  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'



   sudo apt-get install postgresql postgresql-contrib -y







   docker swarm join --token SWMTKN-1-4lixhof08mimbirlcvq2dflpsva7uxnsw114h41rcpm30mlf54-05hkg6lxydxxmqeyldejixw32 192.168.100.10:2377