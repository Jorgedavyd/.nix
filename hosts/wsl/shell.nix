_: {
    home.file.".local/scripts" = {
        source = ./scripts;
        recursive = true;
    };
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history = {
            save = 10000;
            size = 10000;
        };
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ "git" ];
        };
        shellAliases = {
            ll = "ls -alF";
            la = "ls -A";
            l = "ls -CF";
            vi = "nvim";
            alert = "notify-send --urgency=low -i \"$([ \$? = 0 ] && echo terminal || echo error)\" \"$(history 1 | sed -e 's/^\\s*[0-9]\\+\\s*//;s/[;&|]\\s*alert$//')\"";
        };
        sessionVariables = { EDITOR = "nvim"; };
        profileExtra = ''
            if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
                exec Hyprland
            fi
        '';
        initContent = ''
            VIM_MODE_VICMD_KEY='^C'
            MODE_CURSOR_VIINS="#fe8019 steady bar"
            MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #fe8019"
            MODE_CURSOR_VICMD="#fe8019 steady block"
            MODE_CURSOR_SEARCH="#fe8019 steady underline"
            MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady block"
            MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #fe8019"

            export PATH="$HOME/java/graalvm/bin:$HOME/.local/scripts:$PATH"
            export JAVA_HOME="$HOME/java/graalvm"

            export FZF_DEFAULT_OPTS="
                --height=99%
                --layout=reverse
                --pointer='█'
                --scrollbar='▌'
                --highlight-line
                --color=hl:#f3be7c
                --color=bg:-1
                --color=gutter:-1
                --color=bg+:#252530
                --color=fg+:#aeaed1
                --color=hl+:#f3be7c
                --color=border:#606079
                --color=prompt:#bb9dbd
                --color=query:#aeaed1:bold
                --color=pointer:#aeaed1
                --color=scrollbar:#aeaed1
                --color=info:#f3be7c
                --color=spinner:#7fa563
                "

            setopt APPEND_HISTORY
            setopt HIST_IGNORE_DUPS

            bindkey -s '^F' 'tmux-sessionizer^M'
            bindkey '^Y' autosuggest-accept
            bindkey -r '^H'
            bindkey -r '^J'
            bindkey -r '^K'
            bindkey -r '^L'

            command -v direnv >/dev/null && eval "$(direnv hook zsh)"
        '';
    };
}
