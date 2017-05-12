module ProjectsHelper
  def limit_description(project)
    description = project.description

    if description.length > 200
      return description[0..197] + "..."
    end

    return description
  end
end
