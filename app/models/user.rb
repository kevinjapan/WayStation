class User < ApplicationRecord
  rolify
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  # Comment
  has_many :comments, through: :roles, source: :resource, source_type: :Comment
  has_many :creator_comments, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Comment
  
  # rolify
  # to do : review clear on different roles here: 
  # user's programme (as a user):
  has_many :programmes, through: :roles, source: :resource, source_type: :Programme
  # user's programmes (as a creator):
  has_many :creator_programmes, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Programme

  
  # future : review - eg creator for each artifact might be overkill - eg a programme creator should be able to del Todo therein..
  has_many :projects, through: :roles, source: :resource, source_type: :Project
  has_many :creator_projects, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Project

  has_many :tasks, through: :roles, source: :resource, source_type: :Task
  has_many :creator_tasks, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Task

  has_many :todos, through: :roles, source: :resource, source_type: :Todo
  has_many :creator_todos, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Todo


  after_create :assign_default_role
  
  validate :must_have_a_role, on: :update

  normalizes :email_address, with: ->(e) { e.strip.downcase }


  private

      def must_have_a_role
         unless roles.any?
            errors.add(:roles, "must have at least 1 role")
         end
      end

      def assign_default_role
         self.add_role(:user) if self.roles.blank?
      end

end
