_: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        histSize = 1000;
        saveHist = 2000;
        ohMyZsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ "zsh-syntax-highlighting" ];
        };
        shellAliases = {
            ll = "ls -alF";
            la = "ls -A";
            l = "ls -CF";
            vi = "nvim";
            alert = "notify-send --urgency=low -i \"$([ \$? = 0 ] && echo terminal || echo error)\" \"$(history 1 | sed -e 's/^\\s*[0-9]\\+\\s*//;s/[;&|]\\s*alert$//')\"";
        };
        shellInit = ''
            VIM_MODE_VICMD_KEY='^C'
            MODE_CURSOR_VIINS="#fe8019 steady bar"
            MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #fe8019"
            MODE_CURSOR_VICMD="#fe8019 steady block"
            MODE_CURSOR_SEARCH="#fe8019 steady underline"
            MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady block"
            MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #fe8019"

            export PATH="$HOME/.local/scripts/:$PATH"

            setopt APPEND_HISTORY
            setopt HIST_IGNORE_DUPS

            bindkey -s '^F' 'tmux-sessionizer^M'
            bindkey -s '^O' 'pdf-fzf^M'
            bindkey '^Y' autosuggest-accept
            bindkey -r '^H'
            bindkey -r '^J'
            bindkey -r '^K'
            bindkey -r '^L'

            command -v direnv >/dev/null && eval "$(direnv hook zsh)"

            if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
                exec Hyprland
            fi
        '';
    };
}
