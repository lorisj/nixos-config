# this file defines all users, their respective operating systems, etc.
# make sure files are named correctly
let
  hpSpec = "hp-spec-laptop";
  nixos = "nixos";
  loris = "loris";
in
{
  machines = [ hpSpec ];
  operatingSystems = [ nixos ];
  users = [ loris ];
  configs = [
    {
      machine = hpSpec;
      OS = nixos;
      users = [ loris ];
    }
  ];
}
