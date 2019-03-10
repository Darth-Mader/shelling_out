#!/usr/bin/env bash

echo "#######################"
echo " We gon make some cron "
echo "#######################"

sleep 3

echo "Would you like your job to run..."
sleep 2
echo "At a specific month(s)? [y/N]"
read ANS
if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
        echo "Enter your specific month (1 for January ... 12 for December)"
        read MONTH
        echo "Add another specific month? [y/N]"
        read ANS
        while [ "$ANS" = "y" -o "$ANS" = "Y" ] ; do
                echo "Enter your specific month (1 for January ... 12 for December)"
                read ANS
                MONTH="$MONTH,$ANS"
                echo "Add another specific month? [y/N]"
                read ANS
        done
else
        MONTH='*'
fi
if ! echo $MONTH | grep -q ',' ; then
        echo "Month intervals? (every 2/3/4.. months?) [y/N]"
        read ANS
        if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
                echo "Every how many month would you like the job to run? (enter number between 1-12)"
                read ANS
                MONTH="$MONTH/$ANS"
        fi
fi

