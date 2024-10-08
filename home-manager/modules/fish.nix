{ host, ... }:

{  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      direnv hook fish | source
    '';
    shellAliases = {
      "v" = "nvim";
      "ns" = "nix-shell --command fish -p";
      "vc" = "cd ~/Dotfiles/Vim-Cheatsheet/ && python main.py";
      "ls" = "eza --icons";
      "fetch" = "fastfetch";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/Dotfiles#${host}";
      "update" = "sudo nix flake update ~/Dotfiles";
      "rprofile" = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
      "garbage" = "sudo nix-collect-garbage -d";
    };
  };
}
