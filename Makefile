# Makefile

hp-spec-switch:
	sudo nixos-rebuild switch --flake .#hp-spec-laptop

hp-spec-build:
	nixos-rebuild build --flake .#hp-spec-laptop
hp-spec-boot:
	sudo nixos-rebuild boot --flake .#hp-spec-laptop
