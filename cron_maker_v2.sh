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
VAR='' #will hold specific part we're working on
CRON='' #will hold every part of the scheduler together
########################################
echo "#######################"
echo " We gon make some cron "
echo "#######################"

sleep 3

for i in minute hour day-of-month month day-of-week; do
  echo "Would you like your job to run..."
  sleep 2
  echo "At a specific $i(s)? [y/N]"
  read ANS
  if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
    echo "Enter your specific $i (numerical)"
    read VAR
    echo "Add another specific $i? [y/N]"
    read ANS
    while [ "$ANS" = "y" -o "$ANS" = "Y" ] ; do
      echo "Enter your specific $i (numerical)"
      read ANS
      VAR="$VAR,$ANS"
      echo "Add another specific $i? [y/N]"
      read ANS
    done
  else
    VAR='*'
  fi
  if ! echo $VAR | grep -q ',' ; then
    echo "$i intervals? (every 2/3/4.. $i""s?) [y/N]"
    read ANS
    if [ "$ANS" = "y" -o "$ANS" = "Y" ] ; then
      echo "Every how many months would you like the job to run? (enter number between 1-12)"
      read ANS
      VAR="$VAR/$ANS"
    fi
  fi
  CRON="$CRON$VAR "
done
echo "For your chosen configuration your cron would be"
echo "$CRON"
sleep 1
echo "#####################"
echo " Thanks for using me "
echo "#####################"
