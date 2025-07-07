{ pkgs, ... }: {
    ## Compilers, Interpreters, LSPs, Formatters and testing
    home.packages = with pkgs; [
        ## Rust
        cargo
        rust-analyzer
        rustPackages.rustfmt

        ## C/C++
        clang-tools
        gcc

        ## Python
        pyright
        black

        ## Java
        maven
        jdt-language-server
        vscode-extensions.vscjava.vscode-java-debug
        vscode-extensions.vscjava.vscode-java-test
        lombok
        jdk23

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
    ];
}
