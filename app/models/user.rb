class User < ApplicationRecord
  rolify
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  
  has_many :comments, through: :roles, source: :resource, source_type: :Comment
  has_many :creator_comments, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Comment
  

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
