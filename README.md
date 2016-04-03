SJTUG mirror docker, based on tunasync/jekyll
#Usage
```sh
docker build -t mirror .
docker run -d -v /your/physical-storage-for-mirror:/mnt -p 80:80 mirror bash /home/manage.sh
# -d: daemon
# -v: mounted volume
# -p: mapped port
```

or
```sh
docker build -t mirror .
docker run -v /your/physical-storage-for-mirror:/mnt -p 80:80 -ti mirror bash
# manually start 
bash /home/manage.sh
```


#Tech Detail
![diagram](https://cloud.githubusercontent.com/assets/8121231/14233269/358deb7e-f9f6-11e5-9280-a91766b96eb7.png)

Logs are stored in `/tmp/foo.log`.

#Dev
Pull requests are welcomed.

#LICENSE
GPLv3, except files with specifications.

 > This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 > This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 > You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
