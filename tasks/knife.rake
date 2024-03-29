namespace :knife do
  desc 'bootstrap'
  task :bootstrap, %i[node ssh_user identity_file node_name] do |task, args|
    node          = args[:node]
    ssh_user      = Rake::Knife.ssh_user(args)
    identity_file = Rake::Knife.key(args)
    node_name     = Rake::Knife.node_name(args)

    system("knife bootstrap #{node} --ssh-user #{ssh_user} --sudo --identity-file #{identity_file} --node-name #{node_name}")
  end

  desc 'run chef client'
  task :run_chef_client, %i[node ssh_user identity_file] do |task, args|
    node          = args[:node]
    ssh_user      = Rake::Knife.ssh_user(args)
    identity_file = Rake::Knife.key(args)

    system("knife ssh -x '#{ssh_user}' -i #{Rake::Knife.key(args)} 'name:#{node}' 'sudo chef-client'")
  end

  namespace :cookbook do
    desc 'upload'
    task :upload , %i[cookbook_name] do |task, args|
      system("knife cookbook_upload #{args[:cookbook_name]}")
    end
  end

  namespace :environment do
    desc 'from file'
    task :from_file , %i[env_file] do |task, args|
      system("knife environment from file #{Rake::Knife.env_file(args)}")
    end
  end

  namespace :node do
    desc 'runlist item add'
    task :add , %i[node run_list_item] do |task, args|
      next puts "* run_list_item seems to be default, so add nothing to #{args[:node]}" if args[:run_list_item].eql?('run_list_item')
      system("knife node run_list add #{args[:node]} #{args[:run_list_item]}")
    end

    desc 'runlist item remove'
    task :remove , %i[node run_list_item] do |task, args|
      next puts "* run_list_item seems to be default, so delete nothing from #{args[:node]}" if args[:run_list_item].eql?('run_list_item')
      system("knife node run_list remove #{args[:node]} #{args[:run_list_item]}")
    end

    desc 'environment set'
    task :environment_set , %i[node environment] do |task, args|
      system("knife node environment_set #{args[:node]} #{args[:environment]}")
    end
  end
end
