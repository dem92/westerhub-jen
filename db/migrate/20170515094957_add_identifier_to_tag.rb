class AddIdentifierToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :cssName, :string
  end
end
