{ pkgs }: {
    # Node and pnpm come from the nodejs-24 module declared in .replit, so do
    # not pin pkgs.nodejs / pkgs.nodePackages.pnpm here: on older channels those
    # are Node 20 and pnpm 8, which cannot read this project's lockfile v9.
    deps = [
        pkgs.cowsay
    ];
}
