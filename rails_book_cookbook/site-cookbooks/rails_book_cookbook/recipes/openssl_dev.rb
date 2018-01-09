# Cookbook Name:: rails_book_cookbook
# Recipe:: openssl_dev

package "openssl-devel" do
  package_name value_for_platform(
    %w[centos redhat suse fedora] => { "default" => "openssl-devel" },
    "default" => "libssl-dev"
  )
end 

