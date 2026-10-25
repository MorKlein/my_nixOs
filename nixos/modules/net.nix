{
  networking.networkmanager.enable = true;

  networking.firewall.extraCommands = ''
    iptables -t mangle -I nixos-fw-rpfilter 1 -i singbox -j RETURN
  '';

}
