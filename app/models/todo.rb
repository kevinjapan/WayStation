class Todo < ApplicationRecord

   belongs_to :task

   has_many :comments, as: :commentable

   has_rich_text :desc
   
   # ensure all Todos have a title
   validates :title, presence: true

end
