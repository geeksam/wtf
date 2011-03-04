require 'sinatra'
require './config/environment'

helpers do

  def link_to(url, text=url, opts={})
    attributes = ""
    opts.each { |key, value| attributes << key.to_s << "=\"" << value << "\" " }
    "<a href=\"#{url}\" #{attributes}>#{text}</a>"
  end

end

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
