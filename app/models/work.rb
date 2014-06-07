class Work < ActiveRecord::Base
	belongs_to :user
	belongs_to :supporter
	has_many :work_commissions
	has_many :commissions, :through => :work_commissions
end
