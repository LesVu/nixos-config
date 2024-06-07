# ❄️ My NixOS Config

```bash
git clone https://github.com/LesVu/nixos-config
mv nixos-config $HOME/nix # Config is supposed to be in the ~/nix directory
cd $HOME/nix
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```
