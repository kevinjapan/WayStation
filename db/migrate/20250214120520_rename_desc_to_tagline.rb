class RenameDescToTagline < ActiveRecord::Migration[8.0]
  def change
      rename_column :programmes, :desc, :tagline
      rename_column :projects, :desc, :tagline
      rename_column :tasks, :desc, :tagline
  end
end
