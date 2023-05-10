# STABLE ALPINE BUILD
# https://hub.docker.com/r/minialta/redbot
FROM alpine:latest
#
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
    # Creating folders for redbot - test
    && mkdir /app \
    && mkdir /scripts \
    && chown $USERNAME:$USERNAME /app \
    && chown $USERNAME:$USERNAME /scripts
ENV PATH="$PATH:/home/$USERNAME/redenv/bin"
ENV PATH="$PATH:/scripts/"
COPY start_bot.sh /scripts/
#
# Creating startup script
RUN printf "scriptstart=1\
\nwhile [ \$scriptstart -gt 0 ]; do\
\necho Checking for '~/redenv'...\
\nsleep 2\
\nif [ ! -d ~/redenv ]; then\
\necho Missing '~/redenv'\
\nsleep 1\
\necho Installing 'redenv' and 'Red-DiscordBot'...\
\nsleep 2\
\npython -m venv ~/redenv\
\nsource ~/redenv/bin/activate\
\npython -m pip install -U pip psutil setuptools wheel\
\npython -m pip install -U Red-DiscordBot\
\nclear\
\necho 'Red-DsicordBot' installed. Starting instance...\
\nsleep 2\
\nredbot-setup --no-prompt --instance-name \$BN --data-path /app/\$BN &&redbot \$BN --token \$TOKEN --prefix \$PF\
\nelse\
\nclear\
\necho '~/redenv' exists.\
\nsleep 1\
\necho Checking if '/app/\$BN' exists...\
\nsleep 1\
\nif [ ! -d /app/\$BN ]; then\
\necho Missing '/app/\$BN'!\
\necho Creating discord bot with supplied settings...\
\nsleep 2\
\nsource ~/redenv/bin/activate\
\nredbot-setup --no-prompt --instance-name \$BN --data-path /app/\$BN &&redbot \$BN --token \$TOKEN --prefix \$PF\
\nelse\
\nclear\
\necho Necessary dirs and files exists.\
\necho Starting discord bot...\
\nsleep 1\
\nsource ~/redenv/bin/activate\
\nredbot \$BN --token \$TOKEN --prefix \$PF\
\nfi\
\nfi\
\ndone" >> /scripts/start_bot.sh
#
RUN chown $USERNAME:$USERNAME /scripts/start_bot.sh \
    && chmod +x /scripts/start_bot.sh
#
USER $USERNAME
#
ENTRYPOINT [ "sh","./scripts/start_bot.sh" ]
#
# docker run -e "BN=BOTName" -e "PF=PREFIX" -e "TOKEN=TOKEN" --name redbot -v /host/mount/point:/app -d glennigen/redbot:latest-alpine