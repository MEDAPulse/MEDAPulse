class CreateActionPlans < ActiveRecord::Migration
  def change
    create_table :action_plans do |t|
      t.belongs_to :client
      t.text :description
      
      t.timestamps
    end
  end
end
