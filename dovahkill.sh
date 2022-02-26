#!/bin/bash

info() {
	echo "
	▓█████▄  ▒█████   ██▒   █▓ ▄▄▄       ██░ ██  ██ ▄█▀ ██▓ ██▓     ██▓    
	▒██▀ ██▌▒██▒  ██▒▓██░   █▒▒████▄    ▓██░ ██▒ ██▄█▒ ▓██▒▓██▒    ▓██▒    
	░██   █▌▒██░  ██▒ ▓██  █▒░▒██  ▀█▄  ▒██▀▀██░▓███▄░ ▒██▒▒██░    ▒██░    
	░▓█▄   ▌▒██   ██░  ▒██ █░░░██▄▄▄▄██ ░▓█ ░██ ▓██ █▄ ░██░▒██░    ▒██░    
	░▒████▓ ░ ████▓▒░   ▒▀█░   ▓█   ▓██▒░▓█▒░██▓▒██▒ █▄░██░░██████▒░██████▒
	▒▒▓  ▒ ░ ▒░▒░▒░    ░ ▐░   ▒▒   ▓▒█░ ▒ ░░▒░▒▒ ▒▒ ▓▒░▓  ░ ▒░▓  ░░ ▒░▓  ░
	░ ▒  ▒   ░ ▒ ▒░    ░ ░░    ▒   ▒▒ ░ ▒ ░▒░ ░░ ░▒ ▒░ ▒ ░░ ░ ▒  ░░ ░ ▒  ░
	░ ░  ░ ░ ░ ░ ▒       ░░    ░   ▒    ░  ░░ ░░ ░░ ░  ▒ ░  ░ ░     ░ ░   
		░        ░ ░        ░        ░  ░ ░  ░  ░░  ░    ░      ░  ░    ░  ░
	░                    ░                                                

	Author: tun43p
	Repository: https://gitlab.com/tun43p/dovahkill
	"
}

help() {
	echo "	Informations: 
		Kill OSX Dock or change his size.

	Options:
		-h	--help: 	Show help
		-k	--kill: 	Kill osx dock
		-r 	--restore: 	Restore osx dock
		-s	--size: 	Set osx dock size
	"
} 


if [ "$1" == "" ]; then
	info
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	info
	help
elif [ "$1" == "-k" ] || [ "$1" == "--kill" ]; then
	defaults write com.apple.dock autohide -bool true && killall Dock
	defaults write com.apple.dock autohide-delay -float 1000 && killall Dock
	defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock
elif [ "$1" == "-r" ] || [ "$1" == "--restore" ]; then
	defaults write com.apple.dock autohide -bool false && killall Dock
	defaults delete com.apple.dock autohide-delay && killall Dock
	defaults write com.apple.dock no-bouncing -bool FALSE && killall Dock
elif [ "$1" == "-s" ] || [ "$1" == "--size" ]; then
	defaults write com.apple.dock tilesize -int $2; killall Dock
else
	echo "Invalid option: $1"
fi
