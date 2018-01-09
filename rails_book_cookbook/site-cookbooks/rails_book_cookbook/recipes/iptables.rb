# Cookbook Name:: rails_book_cookbook
# Recipe:: iptables
include_recipe "simple_iptables"

# Default Policy 
simple_iptables_policy "INPUT" do
  policy "DROP"
end

# enable loopback
simple_iptables_rule "local" do
  rule "--in-interface lo"
  jump "ACCEPT"
end

# enable already connected
simple_iptables_rule "established" do
  rule "-m conntrack --ctstate ESTABLISHED,RELATED"
  jump "ACCEPT"
end

# enable ssh
simple_iptables_rule "ssh" do
  rule "--proto tcp --dport 22"
  jump "ACCEPT"
end

# enable HTTP, HTTPS
simple_iptables_rule "http" do
  rule [ "--proto tcp --dport 80",
         "--proto tcp --dport 443" ]
  jump "ACCEPT"
end


