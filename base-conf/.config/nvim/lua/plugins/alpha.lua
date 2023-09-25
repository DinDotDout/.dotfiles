return {
  "goolord/alpha-nvim",
  opts = function()
    require("alpha.term")

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = "  𝕟 𝕖 𝕠 𝕧 𝕚 𝕞  "
    dashboard.section.header.val = {
      "                              .::-::-::.                               ",
      "                       :=*#@@@@@@@@@@@@@@@@#+                       ",
      "                  .-.   -#@@@@@@@@@@@@@@@@@@@:  %*=.                ",
      "               .=%@@@#=.  .=#@@@@@@@@@@@@@@@@*  +@@@%+.             ",
      "             -#@@@@@@@@@#-   .=%@@@@@@@@@@@@@@  .@@@@@@#-           ",
      "           =%@@@@@@@@@@@@@@*-   .+%@@@@@@@@@@@-  #@@@@@@@@=         ",
      "         -%@@@@@@@@@@@@@@@@@@@#-   .=%@@@@@@@@%  -@@@@@@@@@%-       ",
      "        *@@@@@@@@@@@@@@@@@@@@@@@@*:   .+@@@@@@@.  @@@@@@@@@@@*      ",
      "      .%@@@@@@@@@@@@@@@@@%%*+==-:.       :+%@@@=  *@@@@@@@@@@@%.    ",
      "     :@@@@@@@@@%#*+=-:.                     :+%%  :@@@@@@@@@@@@#    ",
      "    .#**==-:.      .::                         :   %@@@@@@@@@@=     ",
      "         .:-=+*#%@@@#                              +@@@@@@@@%.  =@. ",
      "   =*#%@@@@@@@@@@@@=                               .@@@@@@@#  .#@@# ",
      "  .@@@@@@@@@@@@@@@:                                 #@@@@@=  -@@@@@:",
      "  +@@@@@@@@@@@@@#                                   =@@@@:  +@@@@@@*",
      "  %@@@@@@@@@@@@+                                     @@*  .#@@@@@@@@",
      "  @@@@@@@@@@@%:                                      *-  -@@@@@@@@@@",
      "  @@@@@@@@@@#   *                                       +@@@@@@@@@@@",
      "  %@@@@@@@@+  :%@-                                    .%@@@@@@@@@@@@",
      "  *@@@@@@@-  +@@@*                                   -@@@@@@@@@@@@@#",
      "  -@@@@@#.  #@@@@@                                  *@@@@@@@@@@@@@@=",
      "   %@@@*  :%@@@@@@-                               .%@@@@@@@@@@@@@@@ ",
      "   -@@-  =@@@@@@@@#                              -@@@@@@@%#*+=--..  ",
      "    -   *@@@@@@@@@@.                            -*+=-:.      .:-=:  ",
      "      :%@@@@@@@@@@@+  **-                         ..-==+##%@@@@@*   ",
      "      =@@@@@@@@@@@@%  :@@@*-            ..-=+*#%@@@@@@@@@@@@@@@*    ",
      "       :@@@@@@@@@@@@.  @@@@@@*-    :*%@@@@@@@@@@@@@@@@@@@@@@@@-     ",
      "         *@@@@@@@@@@+  +@@@@@@@@*-   -*@@@@@@@@@@@@@@@@@@@@@#.      ",
      "          :%@@@@@@@@@  .@@@@@@@@@@@*-   -#@@@@@@@@@@@@@@@@%-        ",
      "            -#@@@@@@@:  %@@@@@@@@@@@@@+:   =#@@@@@@@@@@@#-          ",
      "              .=%@@@@#  +@@@@@@@@@@@@@@@@*:   =#@@@@@%+.            ",
      "                 .=#@@. .@@@@@@@@@@@@@@@@@@@*:   -*+:               ",
      "                     :.  #@@@@@@@@@@@@@@@@@@@@*                     ",
      "                          :-==+**####***==-:",
      "  ",
      "                             𝕟 𝕖 𝕠 𝕧 𝕚 𝕞  ",
    }

    -- dashboard.section.terminal.command = "cat " .. os.getenv("HOME") .. "/.config/nvim/lua/ascii-art/hydra.txt"
    -- dashboard.section.terminal.command = "lolcat " .. os.getenv("HOME") .. "/.config/nvim/header.txt"
    -- dashboard.section.terminal.width = 95
    -- dashboard.section.terminal.height = 60
    -- dashboard.section.terminal.opts.redraw = true
    --
    -- dashboard.section.buttons.val = {
    --   -- dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>"),
    --   dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    --   dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    --   dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    --   dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
    --   dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    --   dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
    --   dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
    --   dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    -- }

    -- for _, button in ipairs(dashboard.section.buttons.val) do
    --   button.opts.hl = "AlphaButtons"
    --   button.opts.hl_shortcut = "AlphaShortcut"
    -- end

    -- dashboard.section.header.opts.hl = "AlphaHeader"
    -- dashboard.section.buttons.opts.hl = "AlphaButtons"
    -- dashboard.section.footer.opts.hl = "AlphaFooter"
    -- dashboard.opts.layout[1].val = 8
    -- --
    -- dashboard.config.layout = {
    --   { type = "padding", val = 10 },
    --   dashboard.section.terminal,
    --   -- { type = "padding", val = 10 },
    --   dashboard.section.header,
    --   { type = "padding", val = 2 },
    --   dashboard.section.buttons,
    --   { type = "padding", val = 1 },
    --   dashboard.section.footer,
    -- }

    return dashboard
  end,
}
