# STABLE DEBIAN BUILD
# https://hub.docker.com/r/glennigen/redbot:latest-debian
#FROM alpine:latest
FROM debian:stable-slim
#
ENV RED_INSTANCENAME=
ENV RED_PREFIX=
ENV RED_TOKEN=
ENV RED_OVERWRITE_INSTANCE=No
ENV RED_USER_ID=99
ENV RED_USERNAME=redbot
ENV RED_ADDITIONAL_PATHS=/home/${RED_USERNAME}/redenv/bin:/scripts
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${RED_ADDITIONAL_PATHS}"
#
#Create user defined by ${RED_USERNAME}
RUN useradd -m -s /bin/bash -u $RED_USER_ID $RED_USERNAME
RUN usermod -aG users $RED_USERNAME
#
# Updating and installing requirements for Red-DiscordBot.
RUN apt-get update -y
RUN apt-get full-upgrade -y
RUN apt-get install -y python3 python3-dev python3-venv git openjdk-17-jre-headless build-essential nano dos2unix
# Creating folders for Red
RUN apt-get clean -y
RUN mkdir /app
RUN mkdir /scripts
RUN chown $RED_USERNAME:users /app
RUN chown $RED_USERNAME:users /scripts
COPY scripts/start.sh /scripts/
RUN chown $RED_USERNAME:users /scripts/start.sh
RUN chmod +x /scripts/start.sh
RUN dos2unix /scripts/start.sh

USER $RED_USERNAME
ENTRYPOINT [ "/bin/bash","./scripts/start.sh" ]