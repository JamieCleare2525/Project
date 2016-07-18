class AddActualOutcome < ActiveRecord::Migration[5.0]
  def change
    add_column :bugs, :actual_outcome, :text
  end
end
