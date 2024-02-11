# Red (formerly known as Red-DiscordBot) - unofficial repo
Unofficial repo for Red docker container<br/>
Official repo: https://github.com/Cog-Creators/Red-DiscordBot <br/>

---
This is working for now, and doesn't need to much tinkering. There will always be room for some improvements.<br/>
I have containerize Red and it runs on Alpine linux.<br/>
It's pretty much "set and forget". When there is a new Red update, just pull a new image, that way you will have the newest Alpine and Red-DiscordBot.<br/>
Just remember to mount the /app directory so you dont lose all your settings and Cogs: `/host/mount/point:/app`<br/>

Docker Hub: https://hub.docker.com/r/glennigen/redbot<br/>

---
I created this, because I wanted to run Red in a container, so I wouldn't have to maintain the bot and the OS myself. Also this is lightweight about 800MB :)

---
I have setup the container in Unraid with these settings.<br/>
![Unraid Image](https://github.com/GlennIgen/redbot/assets/64850623/051c84f0-eb28-41b7-b66f-faa3368aa355)
