{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    historyLimit = 100000;
    mouse = true;
    prefix = "C-a";
    extraConfig = ''
      set-option -g status-position top
      set -as terminal-features ",xterm-256color:RGB"
    '';
    plugins = with pkgs; [ tmuxPlugins.nord ];
  };
}
