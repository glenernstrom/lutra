{ config, pkgs, ...}:

{

  environment.systemPackages =  with pkgs;
   let
     R-with-my-packages = rWrapper.override { 
      packages = with rPackages; [
        ggplot2
        dplyr
      ];
     };

     RStudio-with-my-packages = rstudioWrapper.override {
       packages = with rPackages; [
         ggplot2
	 dplyr
       ];
      };
   in
   [
    # science!
     R-with-my-packages
     RStudio-with-my-packages
     pymol
     fiji
     kdePackages.kalzium
     labplot
     kstars
   ];

}
