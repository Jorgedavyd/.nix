local bundles = {}

local function get_debug_bundles()
    return vim.fn.glob(
        vim.fn.resolve(os.getenv("HOME") .. "/java/java-debug/com.microsoft.java.debug.plugin/target/*.jar")
    )
end

local function get_test_bundles()
    return vim.fn.glob(
        vim.fn.resolve(os.getenv("HOME") .. "/java/vscode-java-test/java-extension/com.microsoft.java.test.plugin/target/com.microsoft.java.test.plugin-*.jar"), 1
    )
end

local function get_paths()
    local lombok_jar = vim.fn.resolve(os.getenv("HOME") .. "/java/lombok.jar")
    local base = vim.fn.resolve(os.getenv("HOME") .. "/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/")
    local jdtls_launcher = vim.fn.glob(
        vim.fn.resolve(base .. "/org.eclipse.equinox.launcher_*.jar")
    )
    local config_dir = vim.fn.resolve(base .. "/../config_linux")
    return jdtls_launcher, config_dir, lombok_jar
end

table.insert(bundles, get_debug_bundles())
table.insert(bundles, get_test_bundles())

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name
local jdtls_launcher, config_dir, lombok_jar = get_paths()

local cmd = {
        "java",
        "-javaagent:" .. lombok_jar,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "-Xmx4G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", jdtls_launcher,
        "-configuration", config_dir,
        "-data", workspace_dir
    }

local config = {
    cmd = cmd,
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
    settings = {
        java = {
            home = vim.fn.getenv("JAVA_HOME"),
            eclipse = { downloadSources = true },
            compile = { nullAnalysis = { mode = "automatic" } },
            configuration = {
                updateBuildConfiguration = "interactive",
                compiler = { annotationProcessing = { enabled = true }},
            },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            saveActions = { organizeImports = true },
            format = {
                enabled = true,
                settings = {
                    url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
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
            inlayHints = {
                parameterNames = { enabled = "all" },
            }
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
