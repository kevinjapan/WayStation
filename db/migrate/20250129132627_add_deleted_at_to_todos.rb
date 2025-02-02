class AddDeletedAtToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :deleted_at, :datetime
  end
end
