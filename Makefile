# Makefile
switch:
	sudo nixos-rebuild switch --flake .#hp-spec-laptop

build:
	nixos-rebuild build --flake .#hp-spec-laptop

boot:
	sudo nixos-rebuild boot --flake .#hp-spec-laptop
