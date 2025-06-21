{ pkgs, ... }: {
    ## Compilers, Interpreters, LSPs, Formatters and testing
    home.packages = with pkgs; [
        ## Rust
        cargo
        rust-analyzer
        rustPackages.rustfmt

        ## C/C++
        clang-tools

        ## Python
        pyright
        black

        ## Java
        maven
        jdt-language-server
        vscode-extensions.vscjava.vscode-java-debug
        vscode-extensions.vscjava.vscode-java-test

        ## Lua
        lua-language-server
        stylua

        ## Zig
        zls
        zig

        ## Nix
        nil

        ## LLDB (zig, rust, cpp, c)
        lldb
    ];
}
