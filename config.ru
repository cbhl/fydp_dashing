require 'dashing'

configure do
  set :auth_token, 'hWP9oeqsLMnf565xxvCGILxbq8DQOOxZ4wc9qpVc'
  set :default_dashboard, 'build'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
