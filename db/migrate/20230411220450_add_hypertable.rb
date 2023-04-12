class AddHypertable < ActiveRecord::Migration[7.0]
  def change
   execute "SELECT create_hypertable('page_loads', 'created_at');"
  end
end
