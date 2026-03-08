# Vim aliases
alias vim='nvim'
alias vi='nvim'

# Docker aliases
alias dps='docker ps -a'
alias dpa='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dimages='docker images'
alias dclean='docker system prune -a'
alias dlogs='docker logs'
alias dstopall='docker stop $(docker ps -a -q)'
alias drun='docker run'
alias dexec='docker exec -it'
alias dbuild='docker build'
alias dcompose='docker-compose'
alias dvolume='docker volume'
alias dnetwork='docker network'

# Docker Compose aliases
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcp='docker-compose pull'
alias dcps='docker-compose ps'
alias dcl='docker-compose logs'
alias dcx='docker-compose exec'

# Bash aliases
alias c='clear'
alias t='tmux'
alias ll='ls -lisa'
alias l='ll'
alias h='cd ~'
alias s='sudo'
alias sl='s $(history -p !!)' 
alias rb='source ~/.bashrc'
alias restart-pipewire='systemctl --user restart pipewire wireplumber'

# Git aliases
alias gs='git status'
alias gc='git clone'
alias gp='git pull'
alias gps='git push'
alias gf='git fetch'
alias gco='git checkout'
alias grm='git rm'
alias ga='git add'

# Weather
alias w='curl wttr.in'

# Tmux aliases
alias rt='tmux source-file ~/.tmux.conf'

# liquidctl aliases

alias rainbow-on='liquidctl --match smart set sync color spectrum-wave'
alias rainbow-off='liquidctl --match smart set sync color off'
