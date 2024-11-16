#!/bin/bash
scriptstart=1
while [ $scriptstart -gt 0 ]; do
echo Checking for "~/redenv"...
sleep 2
if [ ! -d ~/redenv ]; then
echo Missing "~/redenv"
sleep 1
echo Installing "redenv" and "Red-DiscordBot"...
sleep 2
python3 -m venv ~/redenv
source ~/redenv/bin/activate
python3 -m pip install -U pip psutil setuptools wheel
python3 -m pip install -U Red-DiscordBot
clear
echo "Red-DiscordBot" installed. Starting instance...
sleep 2
if [ "$RED_OVERWRITE_INSTANCE" == "Yes" ]; then
redbot-setup --no-prompt --instance-name $RED_INSTANCENAME --data-path /app/$RED_INSTANCENAME --overwrite-existing-instance | redbot $RED_INSTANCENAME --token $RED_TOKEN --prefix $RED_PREFIX
else
redbot-setup --no-prompt --instance-name $RED_INSTANCENAME --data-path /app/$RED_INSTANCENAME | redbot $RED_INSTANCENAME --token $RED_TOKEN --prefix $RED_PREFIX
fi
else
clear
echo "~/redenv" exists.
sleep 1
echo Checking if "/app/$RED_INSTANCENAME" exists...
sleep 1
if [ ! -d /app/$RED_INSTANCENAME ]; then
echo Missing "/app/$RED_INSTANCENAME"!
echo Creating discord bot with supplied settings...
sleep 2
source ~/redenv/bin/activate
if [ "$RED_OVERWRITE_INSTANCE" == "Yes" ]; then
redbot-setup --no-prompt --instance-name $RED_INSTANCENAME --data-path /app/$RED_INSTANCENAME --overwrite-existing-instance | redbot $RED_INSTANCENAME --token $RED_TOKEN --prefix $RED_PREFIX
else
redbot-setup --no-prompt --instance-name $RED_INSTANCENAME --data-path /app/$RED_INSTANCENAME | redbot $RED_INSTANCENAME --token $RED_TOKEN --prefix $RED_PREFIX
fi
else
clear
echo Necessary dirs and files exists.
echo Starting discord bot...
sleep 1
source ~/redenv/bin/activate
redbot $RED_INSTANCENAME --token $RED_TOKEN --prefix $RED_PREFIX
fi
fi
done