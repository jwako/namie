class SupporterArea < ActiveRecord::Base
	belongs_to :supporter
	belongs_to :area
	
end
