require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  project = Project.new({:title => params[:title_input], :id => nil})
  project.save()
  redirect to('/projects')
end

get('/projects/new') do
  @projects = Project.all
  erb(:new_project)
end
