class Task < ApplicationRecord
   
   # adds methods to add and remove projects to an Programme, and much more.
   has_many :todos, dependent: :destroy
   
   belongs_to :project

   has_rich_text :desc
   
   # ensure all Tasks have a title
   validates :title, presence: true


end
