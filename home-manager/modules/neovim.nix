{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter-parsers.hyprlang
      telescope-nvim
      plenary-nvim
    ];

    extraPackages = with pkgs; [
      python313Packages.python-lsp-server
      nixd

      # LSP: автодополнение, диагностика, переходы к определениям
      clang-tools

      # Компилятор C/C++
      gcc

      # Сборка проектов
      gnumake
      cmake
      ninja

      # Отладчик
      gdb

      # Форматирование кода
      clang-tools

      # Утилиты для проектов
      pkg-config

    ];
  };
}
