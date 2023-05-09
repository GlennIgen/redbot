# STABLE ALPINE BUILD
# https://hub.docker.com/r/minialta/redbot
FROM alpine:latest

ENV BN=NameNotSet
ENV PF=PrefixNotSet
ENV TOKEN=TokenNotSet
ARG USERNAME=redbot
ARG USER_UID=1000
#
#Create user defined by $USERNAME
RUN adduser -u $USER_UID -D $USERNAME \
    #
    # Updating and installing requirements for Red-DiscordBot.
    && apk update \
    && apk upgrade --no-cache \
    && apk add python3 python3-dev py3-virtualenv py3-pip git openjdk11-jre-headless build-base linux-headers htop nano \
    # Creating folders for redbot
    && mkdir /app \
    && mkdir /scripts \
    && chown $USERNAME:$USERNAME /app \
    && chown $USERNAME:$USERNAME /scripts
ENV PATH="$PATH:/home/$USERNAME/redenv/bin"
ENV PATH="$PATH:/scripts/"
COPY start_bot.sh /scripts/

RUN chown $USERNAME:$USERNAME /scripts/start_bot.sh \
    && chmod +x /scripts/start_bot.sh

USER $USERNAME

ENTRYPOINT [ "sh","./scripts/start_bot.sh" ]

# docker run -e "BN=testbot" -e "PF=½" -e "TOKEN=TOKEN" --name redbot -v C:\redbot-data:/app -d minialta:latest