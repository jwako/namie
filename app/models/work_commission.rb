class WorkCommission < ActiveRecord::Base
  belongs_to :work
  belongs_to :commission
end
