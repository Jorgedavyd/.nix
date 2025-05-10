{ ... }:
{
    services = {
        bluetooth = {
            enable = true;
            settings = {
                General = {
                    Enable = "Source,Sink,Media,Socket";
                };
            };
        };
        xserver = {
            enable = true;
            displayManager.gdm = {
                enable = true;
                wayland = true;
            };
        };
    };
}
