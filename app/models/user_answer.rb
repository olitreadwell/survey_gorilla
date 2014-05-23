class UserAnswer < ActiveRecord::Base
  belongs_to :response_option
  belongs_to :user
end
