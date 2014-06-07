class Commission < ActiveRecord::Base
	has_many :supporters
  has_many :work_commissions, :dependent => :destroy
  has_many :works, :through => :work_commissions
end
