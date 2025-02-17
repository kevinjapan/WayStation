class Todo < ApplicationRecord

   belongs_to :task
   
   # rolify
   resourcify
   has_many :users, through: :roles, class_name: 'User', source: :users
   has_many :creators, -> { where(roles: {name: :creator}) }, through: :roles, class_name: 'User', source: :users

   has_many :comments, as: :commentable

   # ensure all Todos have a title
   validates :title, presence: true

end
