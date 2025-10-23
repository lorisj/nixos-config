{ inputs, ... }:
{
  gitConfig = {
    userName = "lorisj-elefant";
    userEmail = "loris@elefant.gg";
  };
  colorScheme = inputs.nix-colors.colorSchemes.danqing;
  wallPaper = ../.assets/van-sickle.jpg;
}
