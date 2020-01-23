# docker-open5gs

A Docker recipe of [Open5GS](https://open5gs.org/open5gs/)


## Testing Environment

- Host machine
  - OS: Ubuntu 16.04 (Kernel version: 4.15.0-55-generic)
  - CPU: Intel Core i5-4460 (3.2 GHz 4 cores)
- Software
  - Docker v18.09.7-ce
  - docker-compose v1.23.1


## Usage

1. Create Docker images of Open5GS EPC functions using the source.  Here, I used v1.2.0 tagged branch.
```
git clone https://github.com/open5gs/open5gs.git
cd open5gs/docker
USER=open5gs DIST=ubuntu TAG=bionic BRANCH=v1.2.0 docker-compose build
```

The followings are an example of the result after built.
```
docker images
REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
open5gs/ubuntu-bionic-open5gs-dev                latest              60ce320cd82f        4 minutes ago       783MB
open5gs/ubuntu-bionic-open5gs-build              latest              598d8fe79919        6 minutes ago       639MB
open5gs/ubuntu-bionic-open5gs-base               latest              11250baae03a        6 minutes ago       391MB
open5gs/open5gs-webui                            latest              f2a6fb2657ac        3 hours ago         1GB
```

2. Fetch this repository, and run Docker containers.
```
git clone https://github.com/hassiweb/docker-open5gs
cd docker-open5gs
docker-compose up
```

3. Modify iptables to forward S1-MME (SCTP) packets from eNB to the MME container.
```
sudo sh foward_s1_to_mme.sh start
```

## License

MIT


## Reference

This repository is a simplified and updated version of [ravens](https://github.com/ravens)/[**docker-nextepc**](https://github.com/ravens/docker-nextepc) ****from NextEPC to Open5GS. I appreciate him and his great work! 

