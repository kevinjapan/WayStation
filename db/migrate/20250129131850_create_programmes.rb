class CreateProgrammes < ActiveRecord::Migration[8.0]
  def change
    create_table :programmes do |t|
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
