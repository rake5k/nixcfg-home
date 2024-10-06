{ inputs, ...}:

{
  custom.roles.homeage.secretsBasePath = "${inputs.nixcfg-secrets}/home";
}
