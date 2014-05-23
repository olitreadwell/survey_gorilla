class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :response_options
end
