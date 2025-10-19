{config, lib, ...}:

{

 #  Enable nvf
     programs.nvf = {
       enable = true;

     settings = {
       vim.theme.enable = true;
       vim.theme.name = "catppuccin";
       vim.theme.style = "mocha";
       vim.statusline.lualine.enable = true;
       vim.visuals.nvim-web-devicons.enable = true;
       vim.clipboard.enable = true;
                        # vim.autocomplete.nvim-cmp.enable = true;
                        #vim.telescope.enable = true;
                        # vim.languages.enableTreesitter = true;
                        # vim.lsp.lspconfig.enable = true;
                        # vim.lsp.enable = true;
                        # vim.lsp.servers.markdown.enable = true;
                        # vim.lsp.servers.nix.enable = true;
                        # vim.lsp.servers.r.enable = true;
                        # vim.lsp.servers.python.enable = true;
                        # vim.languages.nix.enable = true;
                        # vim.languages.markdown.enable = true;
                        # vim.languages.r.enable = true;
                        # vim.languages.python.enable = true;

     };
    };
}
