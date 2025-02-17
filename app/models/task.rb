class Task < ApplicationRecord
   
   # adds methods to add and remove projects to an Programme, and much more.
   has_many :todos, dependent: :destroy
   
   belongs_to :project
   
   # rolify
   resourcify
   has_many :users, through: :roles, class_name: 'User', source: :users
   has_many :creators, -> { where(roles: {name: :creator}) }, through: :roles, class_name: 'User', source: :users

   has_many :comments, as: :commentable

   # ensure all Tasks have a title
   validates :title, presence: true


end
