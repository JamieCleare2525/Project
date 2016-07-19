class AddPictureToBugs < ActiveRecord::Migration[5.0]
  def change
    add_column :bugs, :picture, :string
  end
end
