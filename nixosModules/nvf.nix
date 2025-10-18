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
       vim.languages.markdown.lsp.enable = true;
       vim.languages.nix.lsp.enable = true;
       vim.languages.r.lsp.enable = true;
       vim.languages.python.lsp.enable = true;
       vim.clipboard.enable = true;
       
     };

}
