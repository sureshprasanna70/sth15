class Forum < ActiveRecord::Base
  belongs_to :user
  ratyrate_rateable 'contents'
  has_many :feedback
end
