class User < ActiveRecord::Base
  has_secure_password

  validates :name, :alias, :email, presence: true
  validates :password, on: :create, length: { minimum: 8 }
  validates :email, uniqueness: true, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }

  before_save :downcase_input

  def downcase_input
    self.email.downcase!
    self.name.downcase!
    self.alias.downcase!
  end
end
