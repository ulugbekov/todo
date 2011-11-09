#default_run_options[:pty] = true
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
#require "rvm/capistrano"

require 'bundler/capistrano'
#require 'bundler'
#require 'bundler/capistrano'
set :rvm_type, :user
set :application, "todo"

set :user, "ec2-user"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ec2", "linuxvc.pem" )]
#ssh_options[:keys] = [File.join(ENV["HOME"], "..", "amazkey/linux.pem")]
set :location, "www.loopnext.com"
#set :user, "ec2-user"
set :scm, :git
set :deploy_via, :copy
set :branch, 'master'
set :repository,  "."
set :rails_env, "production"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :bundle_without, [:development, :test]
set :use_sudo, false
set :deploy_to, "/home/#{user}/loopnext/"
role :web, "#{location}"                          # Your HTTP server, Apache/etc
role :app, "#{location}"                          # This may be the same as your `Web` server
role :db,  "#{location}", :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
   
   
 # after "deploy:update_code", :bundle_install
 # desc "install the necessary prerequisites"
 # task :bundle_install, :roles => :app do
 # run "cd #{release_path} && bundle install"
 # end