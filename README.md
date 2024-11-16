# Red (formerly known as Red-DiscordBot) - Unofficial Repo
Unofficial repo for Red Docker container<br/>
Official repo: [https://github.com/Cog-Creators/Red-DiscordBot](https://github.com/Cog-Creators/Red-DiscordBot) <br/>

---
This containerized version of Red is functional and does not require much tinkering. However, there’s always room for improvement, and updates will be made from time to time.<br/>
The bot has been containerized to run on Debian Stable Slim.<br/>
It’s designed to be "set and forget." When a new version of Red is released, simply pull the latest image to update both Debian and Red-DiscordBot.<br/>
Remember to mount the `/app` directory to avoid losing your settings and Cogs: `/host/mount/point:/app`.<br/>

Docker Hub: [https://hub.docker.com/r/glennigen/redbot](https://hub.docker.com/r/glennigen/redbot)<br/>

---
I created this project because I wanted to run Red in a containerized environment to simplify maintenance of both the bot and the operating system. 😊<br/>

---
### Example Setup in Unraid
Here’s how I’ve set up the container in Unraid:<br/>
![Unraid Image](https://github.com/GlennIgen/redbot/assets/64850623/051c84f0-eb28-41b7-b66f-faa3368aa355)
