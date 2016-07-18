class RenameDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :bugs, :description, :expected_outcome
  end
end
