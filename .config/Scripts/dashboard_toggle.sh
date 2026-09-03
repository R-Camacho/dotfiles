#!/bin/bash
pkill -f dashboard.sh || kitty --app-id=dashboard sh -c $HOME/.config/Scripts/dashboard.sh
