class AddContactToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :contact, :string
  end
end
