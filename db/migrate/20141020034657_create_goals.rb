class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :action_plan
      t.text :description
  
      t.timestamps
    end
  end
end
