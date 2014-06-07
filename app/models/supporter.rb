class Supporter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :supporter_profile
  accepts_nested_attributes_for :supporter_profile
  has_many :supporter_commissions
  has_many :commissions, :through => :supporter_commissions
  has_many :supporter_areas
  has_many :areas, :through => :supporter_areas
  has_many :supporter_services
  has_many :weeks, :through => :supporter_services
  has_many :works
  
  after_create :create_profile

  private

  def create_profile
  	self.build_supporter_profile.save
  end

end
