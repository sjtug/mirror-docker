SJTUG mirror docker, based on tunasync/jekyll

# Preparations

Follow these steps before building the images.

### Prepare tunasync tar ball

Prepare a gzipped tunasync tar ball without version directory (as if generated
by `git archive` without `--prefix`), rename it to `tunasync.tar.gz`, and
place it into `tunasync/`.

You may run
```sh
$ cd tunasync
$ ../utils/genpack.sh tunasync
```
to generate it automatically.

### Generate static mirror-web pages

Suppose the static web contents are supposed to store in `/home/mirror-web`.

Fetch the latest mirror-web and build the pages. You should have working
`jekyll` installed.

```sh
$ utils/genpack.sh mirror-web # may generate an extra .tar.gz, just ignore it
$ cd mirror-web
$ jekyll build -d /home/mirror-web/_site
```

Note that the actual content is stored in the subdir `_site`.

You may also build the pages elsewhere and deploy them in the server.

# Build and run

There are two ways to build an run, the manual way and the `docker-compose`
way. The latter is recommended.

## Build and run manually

### Build tunasync and nginx docker images

```sh
$ cd tunasync
$ docker build -t sjtug/mirror-tunasync .
$ cd ../nginx
$ docker build -t sjtug/mirror-nginx .
```

### Run docker containers

Suppose the static web contents are stored in `/home/mirror-web`, and the
super-massive mirror filesystem is `/home/mirrors`.
The mounting point in docker containers are `/mnt/mirror-web` and
`/mnt/mirrors` respectively.

```sh
$ docker run --name mirrors_tunasync -d \
	-v /home/mirrors:/mnt/mirrors \
	-v /home/mirror-web:/mnt/mirror-web \
	sjtug/mirror-tunasync

$ docker run --name mirrors_nginx -d -p 80:80 \
	-v /home/mirrors:/mnt/mirrors \
	-v /home/mirror-web:/mnt/mirror-web \
	sjtug/mirror-nginx
```

## Use docker-compose

After preparation, configure storage volume path in `docker-compose.yml`, then
simply run
```sh
$ docker-compose -p sjtug up -d
```

# Development
Discussions and pull requests are strongly encouraged.

# LICENSE
GPLv3, except for files with specifications.

 > This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 > This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 > You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
