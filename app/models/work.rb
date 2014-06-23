class Work < ActiveRecord::Base
	belongs_to :user
	belongs_to :supporter
	has_many :work_commissions
	has_many :commissions, :through => :work_commissions

  validates :supporter, :presence => true
  validates :start_at, :presence => true
  validates :address, :presence => true
  validates_uniqueness_of :url_token
  validates_presence_of :url_token
  after_initialize :set_url_token
  before_create :set_end_at

  private
  def set_url_token
    self.url_token = self.url_token.blank? ? generate_url_token : self.url_token
  end

  def generate_url_token
    tmp_token = SecureRandom.urlsafe_base64(6)
    self.class.where(:url_token => tmp_token).blank? ? tmp_token : generate_url_token
  end

  def set_end_at
    self.end_at = self.start_at + 2.hours
  end
end
