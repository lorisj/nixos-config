{
  programs.bash.shellAliases = {
    rr = "cd $(git rev-parse --show-toplevel)"; # goto repo root
  };
}
