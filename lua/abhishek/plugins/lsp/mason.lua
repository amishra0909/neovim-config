local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "sumneko_lua",
        "jdtls",
        "groovyls",
        "quick_lint_js",
        "ltex",
        "jedi_language_server",
        "lemminx",
        "yamlls",
        "terraformls",
        "sqlls",
        "jsonls",
        "graphql",
        "gradle_ls",
        "clangd",
        "angularls",
        "neocmake",
        "perlnavigator",
        "bashls",
    }
})
