local bundles = {}

local function get_debug_bundle()
    local ext_root = vim.fn.system("nix eval --raw nixpkgs#vscode-extensions.vscjava.vscode-java-debug")
    local jar_path = ext_root:gsub("\n", "") .. "/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-*.jar"
    return vim.fn.glob(jar_path, 1)
end

local function get_test_bundles()
    local ext_root = vim.fn.system("nix eval --raw nixpkgs#vscode-extensions.vscjava.vscode-java-test")
    return vim.split(vim.fn.glob(ext_root:gsub("\n", "") .. "/share/vscode/extensions/vscjava.vscode-java-test/server/*.jar", 1), "\n")
end

table.insert(bundles, get_debug_bundle())
vim.list_extend(bundles, get_test_bundles())

local jdk = vim.fn.getenv("JAVA_HOME")
local jdtls = require("jdtls")

local config = {
    cmd = {
        "jdtls",
        "-configuration", vim.fn.stdpath("cache") .. "/jdtls/config_linux",
        "-data", vim.fn.stdpath("cache") .. "/jdtls/workspace",
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle", "flake.nix" }),
    settings = {
        java = {
            home = jdk,
            eclipse = { downloadSources = true },
            configuration = {
                updateBuildConfiguration = "interactive",
            },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            signatureHelp = { enabled = true },
            format = { enabled = true },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                importOrder = { "java", "javax", "com", "org" },
            },
            sources = {
                organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
    ),
    flags = { allow_incremental_sync = true },
    init_options = {
        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

config["on_attach"] = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)
