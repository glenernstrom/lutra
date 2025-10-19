# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixosModules/nvidia.nix
      ./nixosModules/nvf.nix
      ./nixosModules/science.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lutra"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ernstrom = {
    isNormalUser = true;
    description = "Glen Ernstrom";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages =  with pkgs;
   [
    # tui
     git
     tesseract4

    # utilities
     bitwarden-desktop
     mumble
     chromium
     distrobox
     pcloud
     
    # writing and research
     libreoffice-qt
     hunspell
     hunspellDicts.en_US
     texliveFull
     papers
     pdfarranger
     joplin-desktop

    # graphics
     gimp
     inkscape
     xournalpp
     karp
     scribus

    
    # video
     yt-dlp
     ffmpeg
     obs-studio
  ];


  # List services that you want to enable:

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # For SANE scanner support
  hardware.sane.enable = true;

  # Enable Tailscale mesh network VPN
  services.tailscale.enable = true;

  # Enable hardware graphic acceleration
  hardware.graphics.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # Enable Steam
  programs.steam = {
   enable = true;
   remotePlay.openFirewall = true;
   dedicatedServer.openFirewall = true; 
   localNetworkGameTransfers.openFirewall = true;
  };

   boot.kernelPackages = pkgs.linuxPackages_latest;

   # Enable flakes
   services.flatpak.enable = true;
   
  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 64738 ];
   networking.firewall.allowedUDPPorts = [ 64738 ];

  # Optimize the system
   nix.optimise.automatic = true;
   nix.optimise.dates = [ "03:45" ];

   # Set up Distrobox
   virtualisation.podman = {
    enable = true;
    dockerCompat = true;
   };
   
   fonts.packages = with pkgs; [
      helvetica-neue-lt-std
      aileron
      fira-code
      nerd-fonts.jetbrains-mono
      garamond-libre
    ];

   programs.neovim.enable = true;

   programs.fish.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
