module Rake
  module Knife
    module Constants
      IDENTITY_FILE ||= ->(args) { File.expand_path("../.vagrant/machines/#{args[:node]}/virtualbox/private_key") }.freeze
      SSH_USER      ||= 'vagrant'.freeze
      ENV_DIR       ||= 'environments/'.freeze
      NODE_NAME     ||= ->(args) { args[:node] }.freeze
    end
  end
end
