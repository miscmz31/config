-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
-- General
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true -- relative line numbers
-- vim.opt.wrap = true -- wrap lines
vim.g.python3_host_prog = 'python3'

-- Plugins
lvim.plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    { "tpope/vim-repeat" },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                bind = true,
                floating_window = true,
                handler_opts = { border = "rounded" },
                hint_enable = false
            })
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup("python3")
        end,
    },
    {
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup()
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
}


-- Customizations
lvim.colorscheme = "catppuccin-macchiato"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py" }

lvim.builtin.alpha.active = false
lvim.builtin.treesitter.ensure_installed = {
    "python",
}
lvim.builtin.treesitter.autotag = true

lvim.builtin.telescope.defaults.file_ignore_patterns = {
    ".git/",
    "target/",
    "docs/",
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    -- "%.jpg",
    -- "%.jpeg",
    -- "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
    "%.burp",
    "%.mp4",
    "%.mkv",
    "%.rar",
    "%.zip",
    "%.7z",
    "%.tar",
    "%.bz2",
    "%.epub",
    "%.flac",
    "%.tar.gz",
}

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<C-c>"] = actions.close,
    }
}

-- Key mappings
lvim.builtin.which_key.mappings["f"] = {
    name = "Find",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
}

lvim.builtin.which_key.mappings["l"] = {
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    -- F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        "Next Diagnostic",
    },
    k = {
        "<cmd>lua vim.diagnostic.goto_prev()<cr>",
        "Prev Diagnostic",
    },
    -- v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    o = { "<cmd>Trouble symbols toggle focus=true<cr>", "symbols" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    -- R = { "<cmd>Trouble lsp_references toggle<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
    },
}


lvim.builtin.which_key.mappings[";"] = nil
-- lvim.builtin.which_key.mappings["L"] = nil
lvim.builtin.which_key.mappings["s"] = nil

lvim.lsp.buffer_mappings.normal_mode['gr'] = nil
lvim.keys.normal_mode['gr'] = "<cmd>Telescope lsp_references<cr>"


lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config = {
    height = 0.8,
    width = 0.9,
    prompt_position = "top",
    horizontal = {
        -- preview_cutoff = 120,
        preview_width = 0.6,
    },
}

lvim.lsp.on_attach_callback = function(client, bufnr)
    require "lsp_signature".on_attach()
end

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzf")
end
