class Project
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(project_to_compare)
    if project_to_compare != nil
      self.title() == project_to_compare.title()
    else
      false
    end
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM project;")
    projects = []
    returned_projects.each()do |project|
    title = project.fetch("title")
    id = project.fetch("id").to_i
    projects.push(Project.new({:title => title, :id => id}))
  end
  projects
end

  def save
    result = DB.exec("INSERT INTO project (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

end
