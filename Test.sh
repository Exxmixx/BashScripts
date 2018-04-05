#!/bin/bash

read -p "Do you want to install NetworkMiner? <y/n> " prompt
{
if [[ $prompt == "y" || $prompt == "Y" ]]; then
  echo "Too bad!!"
elif
  [[ $prompt == "n" || $prompt == "N" ]]; then
    exit 0
else
  echo "Please input y or n"
fi
}
echo "Butts"
