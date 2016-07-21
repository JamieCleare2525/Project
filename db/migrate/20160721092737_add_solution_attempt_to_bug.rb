class AddSolutionAttemptToBug < ActiveRecord::Migration[5.0]
  def change
    add_column :bugs, :solution_attempt, :text
  end
end
