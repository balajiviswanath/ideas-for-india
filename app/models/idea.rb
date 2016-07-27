class Idea < ActiveRecord::Base
  acts_as_votable # to enable the supports option
  acts_as_commentable
  
  has_and_belongs_to_many :project_owners, class_name: "User"
  belongs_to :category
  has_many :posts
  
  validates_format_of :video_url, :with => /\A^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$\z/
  validates :title, :description, :video_url, :presence => true
end
