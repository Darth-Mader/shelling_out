#!/usr/bin/env bash
########################################
#
# Created by: Roi Tiefenbunn
# Date: 10/03/19
# Point of this script: Easy cron configurator for the stupid user
# Execution plan: Taking the user step by step to build the cron scheduler he wants
# Assumptions: NO ASSUMPTIONS NEEDED, Fuck the stupid user
#
########################################
# Defining variables:
ANS='' #reading all the answers and user's inputs
MIN='' #will hold the minute part for the scheduler
HOUR='' #will hold the hour part for the scheduler
DOM='' #will hold the day-of-month part for the scheduler
MONTH='' #will hold the month part for the scheduler
DOW='' #will hold the day-of-week part for the scheduler
########################################
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
                echo "Every how many months would you like the job to run? (enter number between 1-12)"
                read ANS
                MONTH="$MONTH/$ANS"
        fi
fi

sleep 2
echo "Would you like your job to run..."
sleep 2
echo "At a specific day(s) of month? [y/N]"
read ANS
if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
        echo "Enter your specific Day (1 for 1st ... 31 for 31st)"
        read DOM
        echo "Add another specific day of month? [y/N]"
        read ANS
        while [ "$ANS" = "y" -o "$ANS" = "Y" ] ; do
                echo "Enter your specific Day (1 for 1st ... 31 for 31st)"
                read ANS
                DOM="$DOM,$ANS"
                echo "Add another specific day? [y/N]"
                read ANS
        done
else
        DOM='*'
fi
if ! echo $DOM | grep -q ',' ; then
        echo "Day of month intervals? (every 2/3/4.. days?) [y/N]"
        read ANS
        if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
                echo "Every how many days would you like the job to run? (enter number between 1-30)"
                read ANS
                DOM="$DOM/$ANS"
        fi
fi

sleep 2
echo "Would you like your job to run..."
sleep 2
echo "At a specific day(s) of week? (works seperately from day-of-month)  [y/N]"
read ANS
if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
        echo "Enter your specific Day (0 for Sunday ... 6 for Saturday)"
        read DOW
        echo "Add another specific day of week? [y/N]"
        read ANS
        while [ "$ANS" = "y" -o "$ANS" = "Y" ] ; do
                echo "Enter your specific Day (0 for Sunday ... 6 for Saturday)"
                read ANS
                DOW="$DOW,$ANS"
                echo "Add another specific day? [y/N]"
                read ANS
        done
else
        DOW='*'
fi
if ! echo $DOW | grep -q ',' ; then
        echo "Day of week intervals? (every 2/3/4.. days?) [y/N]"
        read ANS
        if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
                echo "Every how many days would you like the job to run? (enter number between 1-7)"
                read ANS
                DOW="$DOW/$ANS"
        fi
fi

sleep 2
echo "Would you like your job to run..."
sleep 2
echo "At a specific hour(s) of the day? [y/N]"
read ANS
if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
        echo "Enter your specific hour (0 for 12AM ... 23 for 11PM)"
        read HOUR
        echo "Add another specific hour? [y/N]"
        read ANS
        while [ "$ANS" = "y" -o "$ANS" = "Y" ] ; do
                echo "Enter your specific hour (0 for 12AM ... 23 for 11PM)"
                read ANS
                HOUR="$HOUR,$ANS"
                echo "Add another specific hour? [y/N]"
                read ANS
        done
else
        HOUR='*'
fi
if ! echo $HOUR | grep -q ',' ; then
        echo "Hour intervals? (every 2/3/4.. hours?) [y/N]"
        read ANS
        if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
                echo "Every how many hours would you like the job to run? (enter number between 1-24)"
                read ANS
                HOUR="$HOUR/$ANS"
        fi
fi

sleep 2
echo "Would you like your job to run..."
sleep 2
echo "At a specific minute(s) of the hour? [y/N]"
read ANS
if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
        echo "Enter your specific minute (0 for XX:00 ... 59 for XX:59)"
        read MIN
        echo "Add another specific minute? [y/N]"
        read ANS
        while [ "$ANS" = "y" -o "$ANS" = "Y" ] ; do
                echo "Enter your specific minute (0 for XX:00 ... 59 for XX:59)"
                read ANS
                MIN="$MIN,$ANS"
                echo "Add another specific minute? [y/N]"
                read ANS
        done
else
        MIN='*'
fi
if ! echo $MIN | grep -q ',' ; then
        echo "Minute intervals? (every 2/3/4.. minutes?) [y/N]"
        read ANS
        if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
                echo "Every how many minutes would you like the job to run? (enter number between 1-60)"
                read ANS
                MIN="$MIN/$ANS"
        fi
fi

#echo "Fuck you"
echo "For your chosen configuration your cron would be"
echo "$MIN $HOUR $DOM $MONTH $DOW"
sleep 1
echo "#####################"
echo " Thanks for using me "
echo "#####################"
