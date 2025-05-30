{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        vim k3s docker helm
    ];
}
