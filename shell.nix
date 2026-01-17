{
  mkShellNoCC,
  pnpm,
  nodejs_25,
}:
mkShellNoCC {
  packages = [pnpm nodejs_25];
}
