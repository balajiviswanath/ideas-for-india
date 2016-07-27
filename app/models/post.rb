class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  validates :content,:presence => true
  
  acts_as_votable # to enable the supports option
  acts_as_commentable
end
