{ inputs, den, pkgs, lib, host, user, ... }: {

imports = [ inputs.den.flakeModule ];

den.aspects.firefox = {
homeManager = { ... }: {

programs.firefox = {
enable = true;

policies = {
Preferences = {
"network.dns.echconfig.enabled" = true;
"network.dns.use_https_rr_as_alpn" = true;
};
};
};

};
};
}
