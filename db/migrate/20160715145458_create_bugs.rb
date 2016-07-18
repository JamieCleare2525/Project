class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.string :status, default: 'reported'

      t.timestamps
    end
  end
end
