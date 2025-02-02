class AddDeletedAtToProgrammes < ActiveRecord::Migration[8.0]
  def change
    add_column :programmes, :deleted_at, :datetime
  end
end
