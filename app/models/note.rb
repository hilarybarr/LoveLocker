class Note < ActiveRecord::Base
  validates :content, :presence => true
 
  belongs_to :lover
  has_many :comments
end
