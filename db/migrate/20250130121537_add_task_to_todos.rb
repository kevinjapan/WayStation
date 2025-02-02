class AddTaskToTodos < ActiveRecord::Migration[8.0]
  def change
    add_reference :todos, :task, null: false, foreign_key: true
  end
end
