require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :participations # a user will have many surveys they have participated in
  has_many :surveys, :through => :participations

  has_many :created_surveys,
           class_name: "Survey",
           foreign_key: "creator_id" # A user has many surveys they have created

  has_many :user_answers # A user has many questions that they have responded to

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end

end
