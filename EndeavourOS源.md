######################################################
####                                              ####
###        EndeavourOS Repository Mirrorlist       ###
####                                              ####
######################################################
#### Entry in file /etc/pacman.conf:
###     [endeavouros]
###     SigLevel = PackageRequired
###     Include = /etc/pacman.d/endeavouros-mirrorlist
######################################################

## Germany
Server = https://mirror.alpix.eu/endeavouros/repo/$repo/$arch

## Sweden
Server = https://ftp.acc.umu.se/mirror/endeavouros/repo/$repo/$arch
Server = https://mirror.linux.pizza/endeavouros/repo/$repo/$arch

## Github
Server = https://github.com/endeavouros-team/mirrors/releases/download/mirror1/
Server = https://raw.githubusercontent.com/endeavouros-team/repo/master/$repo/$arch
