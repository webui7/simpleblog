class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_update :check_name
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  
  private
  
  def check_name
    self.name = self.email if self.name.nil?||self.name.empty?
  end
  
end
