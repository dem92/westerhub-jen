class AddCoverToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :cover, :string
  end
end
