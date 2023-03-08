class User < ApplicationRecord
  include Authority::UserAbilities

  after_initialize :set_default_role, if: :new_record?

  validates :roles, presence: true

  def set_default_role
    self.add_role(:normal)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
