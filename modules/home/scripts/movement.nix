{
  programs.bash.shellAliases = {
    cdrr = "cd $(git rev-parse --show-toplevel)"; # goto repo root
    vimrr = "vim $(git rev-parse --show-toplevel)";
    files = "thunar";
    sd0 = "shutdown 0";
  };
}
