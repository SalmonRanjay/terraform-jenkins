#!/bin/bash

printf "
      ___                      _          _                _      _              
 / __)        _           | |        (_)              | |    (_)             
| |__   ____ | |_    ____ | | _       _   ____  ____  | |  _  _  ____    ___ 
|  __) / _  )|  _)  / ___)| || \     | | / _  )|  _ \ | | / )| ||  _ \  /___)
| |   ( (/ / | |__ ( (___ | | | |    | |( (/ / | | | || |< ( | || | | ||___ |
|_|    \____) \___) \____)|_| |_|   _| | \____)|_| |_||_| \_)|_||_| |_|(___/ 
                                   (__/                                      
"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key


printf "
     _                            _  _      _                      
(_)              _           | || |    (_)                     
 _  ____    ___ | |_    ____ | || |     _   ____  _   _   ____ 
| ||  _ \  /___)|  _)  / _  || || |    | | / _  || | | | / _  |
| || | | ||___ || |__ ( ( | || || |    | |( ( | | \ V / ( ( | |
|_||_| |_|(___/  \___) \_||_||_||_|   _| | \_||_|  \_/   \_||_|
                                     (__/                      
"
sudo yum install java-1.8.0-openjdk -y


printf "
     _                            _  _      _                _      _              
(_)              _           | || |    (_)              | |    (_)             
 _  ____    ___ | |_    ____ | || |     _   ____  ____  | |  _  _  ____    ___ 
| ||  _ \  /___)|  _)  / _  || || |    | | / _  )|  _ \ | | / )| ||  _ \  /___)
| || | | ||___ || |__ ( ( | || || |    | |( (/ / | | | || |< ( | || | | ||___ |
|_||_| |_|(___/  \___) \_||_||_||_|   _| | \____)|_| |_||_| \_)|_||_| |_|(___/ 
                                     (__/                                      
"

sudo yum install -y jenkins 

sudo service jenkins start

sudo chckconfig jenkins openjdk
