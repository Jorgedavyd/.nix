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
        xserver.enable = true;
    };
}
