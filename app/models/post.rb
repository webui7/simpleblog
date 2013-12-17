class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, through: :post_tags
  has_many :post_tags
  has_many :comments
  
  scope :posts_by_tag, ->(tag_id) { joins(:post_tags).where("post_tags.tag_id = ?", tag_id)}
  scope :posts_by_user, ->(user_id) { joins(:user).where("user_id = ?", user_id)}
 end
