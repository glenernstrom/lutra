{config, lib, ... }:

{

  hardware.opengl.enable = true;
  
  # Nvidia graphics settings
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.open = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

}
