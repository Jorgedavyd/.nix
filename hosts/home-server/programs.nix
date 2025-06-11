{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        vim docker kubernetes-helm
    ];
}
