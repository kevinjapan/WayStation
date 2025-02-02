class AddProgrammeToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :programme, null: false, foreign_key: true
  end
end
