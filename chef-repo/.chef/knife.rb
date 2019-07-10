# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :debug
log_location             STDOUT
node_name                "chef-workstation"
client_key               "#{current_dir}/chef-workstation.pem"
chef_server_url          "https://chef-server/organizations/test-org"
cookbook_path            ["#{current_dir}/../cookbooks"]
