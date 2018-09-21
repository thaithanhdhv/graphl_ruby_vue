class AddLastNameToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :last_name, :string
  end
end
