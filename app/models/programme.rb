class Programme < ApplicationRecord

   # adds methods to add and remove projects to an Programme, and much more.
   has_many :projects, dependent: :destroy

   has_many :comments, as: :commentable
   
   has_rich_text :desc

   # ensure all Programmes have a title
   validates :title, presence: true

   
end
