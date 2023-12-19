# Installing FlectraHQ 2.0 with one command (Production).

## Quick Installation

Run for Ubuntu 22.04

``` bash
sudo apt-get purge needrestart
```

Install docker and docker-compose:

``` bash
curl -s https://raw.githubusercontent.com/6Ministers/flectra-2.0prod-docker-compose/master/setup.sh | sudo bash -s
```

Download Flectra 2.0 instance:

``` bash
curl -s https://raw.githubusercontent.com/6Ministers/flectra-2.0prod-docker-compose/master/download.sh | sudo bash -s flectra2.0
```

If `curl` is not found, install it:

``` bash
$ sudo apt-get install curl
# or
$ sudo yum install curl
```

## Usage

Start the container:
``` sh
docker-compose up
```
Then open `https://domain.ltd` to access Flectra 2.0.

- **If you get any permission issues**, change the folder permission to make sure that the container is able to access the directory:

``` sh
$ sudo chmod -R 777 addons
$ sudo chmod -R 777 etc
$ sudo chmod -R 777 postgresql
```


- To run Flectra container in detached mode (be able to close terminal without stopping Flectra):

```
docker-compose up -d
```

- To Use a restart policy, i.e. configure the restart policy for a container, change the value related to **restart** key in **docker-compose.yml** file to one of the following:
   - `no` =	Do not automatically restart the container. (the default)
   - `on-failure[:max-retries]` =	Restart the container if it exits due to an error, which manifests as a non-zero exit code. Optionally, limit the number of times the Docker daemon attempts to restart the container using the :max-retries option.
  - `always` =	Always restart the container if it stops. If it is manually stopped, it is restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in restart policy details)
  - `unless-stopped`	= Similar to always, except that when the container is stopped (manually or otherwise), it is not restarted even after Docker daemon restarts.
```
 restart: always             # run as a service
```

## Custom addons

The **addons/** folder contains custom addons. Just put your custom addons if you have any.

## Flectra configuration & log

* To change Flectra configuration, edit file: **etc/flectra.conf**.
* Log file: **etc/flectra-server.log**
  

## Flectra container management

**Run Flectra**:

``` bash
docker-compose up -d
```

**Restart Flectra**:

``` bash
docker-compose restart
```

**Stop Flectra**:

``` bash
docker-compose down
```

## docker-compose.yml

* caddy:alpine
* flectrahq/flectra:2.0
* postgres:14

