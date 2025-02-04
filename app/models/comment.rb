class Comment < ApplicationRecord

   belongs_to :commentable, polymorphic: true
  
   has_rich_text :content

end
