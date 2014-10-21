class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :goal
      add_index :steps, :goal_id

      t.text :description
      t.date :due_by
      t.boolean :complete, default: false
      
      t.timestamps
    end
  end
end
