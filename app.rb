require 'sinatra'
require './config/environment'
require './helpers'


get '/' do
  erb :index
end


get '/projects' do
  @projects = Project.all
  erb :'projects/index'
end

get '/projects/new' do
  erb :'projects/new'
end

post '/projects' do
  @project = Project.create(params[:project])
  if @project.valid?
    redirect to("/projects/#{@project.slug}")
  else
    erb :'projects/new'
  end
end

get '/projects/:slug' do
  @project = Project.find_by_slug(params[:slug])
  erb :'projects/show'
end
