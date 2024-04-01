# STABLE ALPINE BUILD
# https://hub.docker.com/r/glennigen/redbot:latest-alpine
FROM alpine:latest
#
ENV BN=NameNotSet
ENV PF=PrefixNotSet
ENV TOKEN=TokenNotSet
ENV OVERWRITE_INSTANCE=No
ARG USERNAME=redbot
ARG USER_UID=1000
#
#Create user defined by $USERNAME
RUN adduser -u $USER_UID -D $USERNAME \
    #
    # Updating and installing requirements for Red-DiscordBot.
    && apk update \
    && apk upgrade --no-cache \
    && apk add python3 python3-dev py3-virtualenv py3-pip git openjdk17-jre-headless build-base linux-headers htop nano runuser\
    # Creating folders for redbot
    && mkdir /app \
    && mkdir /scripts \
    && chown $USERNAME:$USERNAME /app \
    && chown $USERNAME:$USERNAME /scripts
ENV PATH="$PATH:/home/$USERNAME/redenv/bin"
ENV PATH="$PATH:/scripts/"
COPY start_bot.sh /scripts/
COPY entrypoint.sh /scripts/
#
# Creating startup script
RUN printf 'scriptstart=1\
\nwhile [ $scriptstart -gt 0 ]; do\
\necho Checking for "~/redenv"...\
\nsleep 2\
\nif [ ! -d ~/redenv ]; then\
\necho Missing "~/redenv"\
\nsleep 1\
\necho Installing "redenv" and "Red-DiscordBot"...\
\nsleep 2\
\npython -m venv ~/redenv\
\nsource ~/redenv/bin/activate\
\npython -m pip install -U pip psutil setuptools wheel\
\npython -m pip install -U Red-DiscordBot\
\nclear\
\necho "Red-DsicordBot" installed. Starting instance...\
\nsleep 2\
\nif [ "$OVERWRITE_INSTANCE" == "Yes" ]; then\
\nredbot-setup --no-prompt --instance-name $BN --data-path /app/$BN --overwrite-existing-instance | redbot $BN --token $TOKEN --prefix $PF\
\nelse\
\nredbot-setup --no-prompt --instance-name $BN --data-path /app/$BN | redbot $BN --token $TOKEN --prefix $PF\
\nfi\
\nelse\
\nclear\
\necho "~/redenv" exists.\
\nsleep 1\
\necho Checking if "/app/$BN" exists...\
\nsleep 1\
\nif [ ! -d /app/$BN ]; then\
\necho Missing "/app/$BN"!\
\necho Creating discord bot with supplied settings...\
\nsleep 2\
\nsource ~/redenv/bin/activate\
\nif [ "$OVERWRITE_INSTANCE" == "Yes" ]; then\
\nredbot-setup --no-prompt --instance-name $BN --data-path /app/$BN --overwrite-existing-instance | redbot $BN --token $TOKEN --prefix $PF\
\nelse\
\nredbot-setup --no-prompt --instance-name $BN --data-path /app/$BN | redbot $BN --token $TOKEN --prefix $PF\
\nfi\
\nelse\
\nclear\
\necho Necessary dirs and files exists.\
\necho Starting discord bot...\
\nsleep 1\
\nsource ~/redenv/bin/activate\
\nredbot $BN --token $TOKEN --prefix $PF\
\nfi\
\nfi\
\ndone' >> /scripts/start_bot.sh

RUN chown $USERNAME:$USERNAME /scripts/start_bot.sh \
    && chmod +x /scripts/start_bot.sh
ENTRYPOINT [ "/bin/sh","./scripts/entrypoint.sh" ]
CMD [ "/bin/sh","./scripts/start_bot.sh" ]
