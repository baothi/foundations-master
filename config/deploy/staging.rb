# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
set :stage, :staging
set :branch, 'master'

role :app, %w{ubuntu@52.89.66.117}
role :web, %w{ubuntu@52.89.66.117}
role :db, %w{ubuntu@52.89.66.117}

# set :delayed_job_workers, 2

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '52.89.66.117', user: 'ubuntu', roles: %w{web}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
set :ssh_options, {
  keys: %w(/Users/troy/aws/foundations_staging.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}