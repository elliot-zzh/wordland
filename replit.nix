{ pkgs }: {
    deps = [
        pkgs.nodejs
        pkgs.nodePackages.pnpm
        pkgs.cowsay
    ];
}