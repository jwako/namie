class SupporterCommission < ActiveRecord::Base
	belongs_to :supporter
	belongs_to :commission
	
end
