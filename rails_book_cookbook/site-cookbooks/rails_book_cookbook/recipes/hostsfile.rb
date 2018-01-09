# Cookbook Name:: rails_book_cookbook
# Recipe:: hostsfile

hostsfile_entry '192.168.1.2' do
  hostname  'octworks.orz.hm'
  action    :append
end

