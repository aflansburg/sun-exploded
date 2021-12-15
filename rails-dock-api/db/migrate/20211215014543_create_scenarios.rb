class CreateScenarios < ActiveRecord::Migration[6.1]
  def change
    create_table :scenarios do |t|
      t.boolean :sun_exploded, null: false
      t.integer :dice, array: true, default: []
      t.boolean :user_convinced, null: false
      t.timestamps
    end
  end
end

