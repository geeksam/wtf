require './config/environment'

get '/' do
  'Hello, world!'
end

get '/projects' do
  @projects = Project.all
  @projects.length.to_s
end
