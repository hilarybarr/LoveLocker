class Proficiency < ActiveRecord::Base
 validates :years_experience, :presence => true
 validates :formal?, :inclusion => {:in => [true, false]}
 
  belongs_to :user
  belongs_to :skill
 
end
