class SupporterService < ActiveRecord::Base
	belongs_to :supporter
	belongs_to :week
end
