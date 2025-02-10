
if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

#to set local man in manpath

set -Ux MANPATH $MANPATH ~/.local/man/
