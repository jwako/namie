class Work < ActiveRecord::Base
  has_many :work_commissions, :dependent => :destroy
  has_many :commissions, :through => :work_commissions
  belongs_to :user
  belongs_to :supporter
end
