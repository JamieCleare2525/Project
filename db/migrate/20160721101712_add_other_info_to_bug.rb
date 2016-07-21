class AddOtherInfoToBug < ActiveRecord::Migration[5.0]
  def change
    add_column :bugs, :other_info, :text
  end
end
