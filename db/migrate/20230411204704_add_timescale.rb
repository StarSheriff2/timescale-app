class AddTimescale < ActiveRecord::Migration[7.0]
  def change
   create_table :page_loads, id: false do |t|
      t.string :user_agent

      t.timestamps
   end
  end
end
