# this file defines all users, their respective operating systems, etc.
# If you add a new user, make sure to update the user folder to add home manager config
# If you add a new machine, make sure to add a new config in /machines/
# If you add a new OS, make sure to add a new config in /OS/
# If you add a user to a machine/OS, make sure that user has a machine/OS specific config.

let
  hpSpec = "hp-spec-laptop";
  nixos = "nixos";
  loris = "loris";
in
{
  configs = [
    {
      machine = hpSpec;
      OS = nixos;
      users = [ loris ];
    }
  ];
}
