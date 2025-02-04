class Task < ApplicationRecord
   
   # adds methods to add and remove projects to an Programme, and much more.
   has_many :todos, dependent: :destroy
   
   belongs_to :project

   has_many :comments, as: :commentable

   # to do : add commentable to all artifacts
   # see Active Record Associations : 4.1 Polymorphic Associations
   # - search for example cli command to do this (above ref only shows manual)
   # - first(?), create Comment class model..
   # - then, make artifacts 
   # eg
   # class Comment < ApplicationRecord
   #    belongs_to :commentable, polymorphic: true
   #  end
    
   #  class Project < ApplicationRecord
   #    has_many :comments, as: :commentable
   #  end
    
   #  class Todo < ApplicationRecord
   #    has_many :comments, as: :commentable
   #  end

   has_rich_text :desc
   
   # ensure all Tasks have a title
   validates :title, presence: true


end
