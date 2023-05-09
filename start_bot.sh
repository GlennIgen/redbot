#!/bin/ash
scriptstart=1
while [ $scriptstart -gt 0 ]; do
echo "Checking for '~/redenv'..."
if [ ! -d ~/redenv ]; then
echo "Missing '~/redenv'"
echo "Installing 'redenv' and 'Red-DiscordBot'..."
python -m venv ~/redenv
source ~/redenv/bin/activate
python -m pip install -U pip psutil setuptools wheel
python -m pip install -U Red-DiscordBot
clear
echo "'Red-DsicordBot' installed. Starting instance..."
redbot-setup --no-prompt --instance-name $BN --data-path /app/$BN &&redbot $BN --token $TOKEN --prefix $PF
else
clear
echo "'~/redenv' exists."
echo "Checking if '/app/$BN' exists..."
if [ ! -d /app/$BN ]; then
echo "Missing '/app/$BN'!"
echo "Creating discord bot with supplied settings..."
source ~/redenv/bin/activate
redbot-setup --no-prompt --instance-name $BN --data-path /app/$BN &&redbot $BN --token $TOKEN --prefix $PF
else
clear
echo "Necessary dirs and files exists."
echo "Starting discord bot..."
source ~/redenv/bin/activate
redbot $BN --token $TOKEN --prefix $PF
fi
fi
done