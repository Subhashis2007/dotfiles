# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/subhashis/.zshrc'
autoload -Uz compinit
compinit

#---------------------Sources---------------------------------#

source ~/.config/zsh/zsh-autosuggestions.zsh 
source ~/.config/zsh/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/you-should-use.plugin.zsh

#--------------------Aliases---------------------------------#
#-------colorizing-grep----------#
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#------Package-Management--------#
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
alias vpacman="sudo vim /etc/pacman.conf"
alias echaotic='sudo sed -i "s/#\[chaotic-aur\]/\[chaotic-aur\]/g" /etc/pacman.conf && sudo sed -i "s/\#Include = \/etc\/pacman.d\/chaotic-mirrorlist/Include = \/etc\/pacman.d\/chaotic-mirrorlist/g" /etc/pacman.conf'
alias dchaotic='sudo sed -i "s/\[chaotic-aur\]/#\[chaotic-aur\]/g" /etc/pacman.conf && sudo sed -i "s/\Include = \/etc\/pacman.d\/chaotic-mirrorlist/#Include = \/etc\/pacman.d\/chaotic-mirrorlist/g" /etc/pacman.conf'
alias ff='fastfetch'
#-------------YT----------------#
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "
alias ytv='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio/best"'
alias yta="yt-dlp -x --audio-format best --audio-quality 0 --embed-thumbnail --no-playlist"
alias ytap="yt-dlp -x --audio-format best --audio-quality 0 --embed-thumbnail"
#-----------bare-git-repo-------#
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias gcp="git cherry-pick"
#--------------Misc-------------#
alias chadwm="startx ~/.config/chadwm/scripts/run.sh"
alias fixadb="sudo adb kill-server && sudo adb start-server" 
alias die="sudo shutdown now"
#----------Prompt--------------#
# colorscript -r
fastfetch
eval "$(starship init zsh)"



