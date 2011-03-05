AppRoot = File.expand_path(File.dirname(__FILE__))
require File.join(AppRoot, *%w[config environment])
require 'sinatra'
require File.join(AppRoot, *%w[helpers])

## App root

get '/' do
  erb :index
end

## Projects

get '/projects' do
  erb :'projects/new'
end

post '/projects/create' do
  @project = Project.create(params[:project])
  if @project.valid?
    redirect to("/projects/#{@project.slug}")
  else
    erb :'projects/new'
  end
end

get '/projects/:slug' do
  @project = Project.find_by_slug(params[:slug])
  if @project.blank?
    redirect to('/projects')
  else
    erb :'projects/show'
  end
end
