{
  programs.bash.shellAliases = {
    cdrr = "cd $(git rev-parse --show-toplevel)"; # goto repo root
    files = "thunar";
  };
}
