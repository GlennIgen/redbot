#!/bin/bash
function goto
{
   label=$1
   cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
   eval "$cmd"
   exit
}
startFunc=${1:-"startFunc"}
goto $startFunc

startFunc:
x=100
goto foo

mid:
x=101
echo "Not printed!"

foo:
x=${x:-10}
echo x is $x
# https://www.tutorialspoint.com/is-there-a-goto-statement-available-in-bash-on-linux
# linux bash script goto

# ------
#!/bin/bash
# Basic while loop
counter=1
while [ $counter -le 10 ]
do
echo $counter
((counter++))
done
echo All done
# ------
# https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
# bash script loop



## test script med LOOP
#!/bin/bash
# Basic while loop
start=1
while [ $start -ge 0 ]; do
if [ -d /app/Test ]; then
redbot Test --token MTEwMTU0MDUzMTM0OTI0NjEwNA.G_yeBy.nF0lOqQ5-RmV7fJ-AelcguKCxyN6Woum-54Wk0 --prefix ½
else
redbot-setup --no-prompt --instance-name Test --data-path /app/Test &&redbot Test --token MTEwMTU0MDUzMTM0OTI0NjEwNA.G_yeBy.nF0lOqQ5-RmV7fJ-AelcguKCxyN6Woum-54Wk0 --prefix ½
fi
done
echo All done
## ------
## https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
## bash script loop