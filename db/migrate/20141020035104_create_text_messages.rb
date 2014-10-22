class CreateTextMessages < ActiveRecord::Migration
  def change
    create_table :text_messages do |t|
      t.belongs_to :client
      add_index :text_messages, :client_id

      t.text :content
      t.boolean :incoming_message
      
      t.timestamps
    end
  end
end
