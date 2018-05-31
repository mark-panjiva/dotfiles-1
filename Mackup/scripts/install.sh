#!/bin/bash
sudo apt-key add install_files/Repo.keys
sudo cp -R install_files/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < install_files/Package.list
sudo dselect
