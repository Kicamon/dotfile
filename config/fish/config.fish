if status is-interactive
    # Commands to run in interactive sessions can go here
	set fish_greeting
	fish_greeting
end

starship init fish | source

source ~/.config/fish/alias.fish

function fish_greeting
	echo '
     █████╗  ██████╗███╗   ███╗███████╗██████╗
    ██╔══██╗██╔════╝████╗ ████║██╔════╝██╔══██╗
    ███████║██║     ██╔████╔██║█████╗  ██████╔╝
    ██╔══██║██║     ██║╚██╔╝██║██╔══╝  ██╔══██╗
    ██║  ██║╚██████╗██║ ╚═╝ ██║███████╗██║  ██║
    ╚═╝  ╚═╝ ╚═════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝'
end
