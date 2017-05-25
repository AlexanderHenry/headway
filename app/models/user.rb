class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_uuid

  # Permissions cascade/inherit through the roles listed below. The order of
  # this list is important, it should progress from least to most privelage
  ROLES = [:admin].freeze
  acts_as_user roles: ROLES
  roles ROLES

  validates :email,
            presence: true,
            format: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,8}\z/i,
            uniqueness: true

  # NOTE: these password validations won't run if the user has an invite token
  validates :password,
            presence: true,
            length: { within: 8..72 },
            confirmation: true,
            on: :create
  validates :password_confirmation,
            presence: true,
            on: :create

  def tester?
    (email =~ /(example.com|headway.io)$/).present?
  end

  private

  def generate_uuid
    loop do
      uuid = SecureRandom.uuid
      self.uuid = uuid
      break unless User.exists?(uuid: uuid)
    end
  end
end
