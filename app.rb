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

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  if @project == nil
    erb(:go_back)
  else
    erb(:project)
  end
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:name => params[:name_input], :project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title_input])
  @projects = Project.all
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/projects')
end
