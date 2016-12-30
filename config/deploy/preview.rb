server "52.213.61.115", user: "deploy", roles: %w{web app db}

set :environment, "preview"
set :rails_env, "preview"
set :rack_env, "preview"
