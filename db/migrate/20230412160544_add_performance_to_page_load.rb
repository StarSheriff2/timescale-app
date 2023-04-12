class AddPerformanceToPageLoad < ActiveRecord::Migration[7.0]
  def change
    add_column :page_loads, :path, :string
    add_column :page_loads, :performance, :float
  end
end
