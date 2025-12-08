{ pkgs, ... }: {
    ## Compilers, Interpreters, LSPs, Formatters and testing
    home.packages = with pkgs; [
        ## Rust
        rustc
        cargo
        rust-analyzer
        rustfmt
        clippy

        ## C/C++
        clang-tools
        gcc

        ## Python
        pyright
        black

        ## Java
        maven
        jdk21

        ## TypeScript, JavaScript, Svelte
        typescript-language-server
        tailwindcss-language-server
        nodejs

        ## Lua
        lua
        lua-language-server
        stylua

        ## Zig
        zls
        zig

        ## Nix
        nil

        ## LLDB (zig, rust, cpp, c)
        vscode-extensions.vadimcn.vscode-lldb.adapter

        ## Python
        python311

        ## Devops
        kubectl

        ## VSCode
        vscode-fhs

        ## Tiltfile
        starpls
    ];
}
