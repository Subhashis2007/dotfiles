#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#Colorize-Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#PackageManagement
alias update-all='paru -Syyu'
alias sps='sudo pacman -S'
alias spr='sudo pacman -R'
alias sprns='sudo pacman -Rns'
alias sprss='sudo pacman -Rss'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cop='pacman -Qtdq'
alias clean='sudo pacman -Rns $(pacman -Qtdq)'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "


#git
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"


#BashCustomization

eval "$(starship init bash)" 

colorscript -r
