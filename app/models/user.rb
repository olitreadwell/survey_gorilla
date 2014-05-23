class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :participations # a user will have many surveys they have participated in

  has_many :created_surveys,
           class_name: "Survey",
           foreign_key: "creator_id" # A user has many surveys they have created

  has_many :user_answers # A user has many questions that they have responded to
end
