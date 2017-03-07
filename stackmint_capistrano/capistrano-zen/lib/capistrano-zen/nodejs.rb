require 'capistrano-zen/base'

configuration = Capistrano::Configuration.respond_to?(:instance) ?
  Capistrano::Configuration.instance(:must_exist) :
  Capistrano.configuration(:must_exist)

configuration.load do
  namespace :nodejs do
    desc "Install the latest relase of Node.js"
    # Reference
    # https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
    task :install, roles: :app do
      run "#{sudo} curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -"
      run "#{sudo} apt-get install nodejs"
    end
  end
end
