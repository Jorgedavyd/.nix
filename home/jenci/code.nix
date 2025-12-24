{ pkgs, ... }: {
    ## Interpreters, LSPs, Formatters and testing
    home.packages = with pkgs; [
        ## Rust
        rust-analyzer
        rustfmt
        clippy

        ## C/C++
        clang-tools
        gcc

        ## Python
        python3
        pyright
        black

        ## Java
        jdk21
        jdt-language-server
        vscode-extensions.vscjava.vscode-java-debug
        vscode-extensions.vscjava.vscode-java-test

        ## TypeScript, JavaScript, Svelte
        typescript-language-server
        tailwindcss-language-server

        ## Lua
        lua
        lua-language-server

        ## Zig
        zls

        ## Nix
        nil

        ## LLDB (zig, rust, cpp, c)
        vscode-extensions.vadimcn.vscode-lldb.adapter
    ];
}
