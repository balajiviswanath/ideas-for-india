class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  acts_as_votable # to enable the supports option
  acts_as_commentable
end
