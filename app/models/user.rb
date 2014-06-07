class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile
  has_many :works, :dependent => :destroy

  after_create :create_profile

  def profile
    user_profile
  end

  private

  def create_profile
  	self.build_user_profile.save
  end

end
