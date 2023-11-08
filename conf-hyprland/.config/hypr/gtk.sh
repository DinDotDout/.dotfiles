#!/bin/sh

gnome_schema="org.gnome.desktop.interface"

gsettings set "$gnome_schema" gtk-theme "Breeze-Dark"
gsettings set "$gnome_schema" icon-theme "Papirus-Dark"
gsettings set "$gnome_schema" cursor-theme "Catppuccin-Mocha-Dark"
gsettings set "$gnome_schema" font-name "Cantarell 11"

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
