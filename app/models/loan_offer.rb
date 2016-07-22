class LoanOffer < ActiveRecord::Base
  belongs_to :user

  validates_numericality_of :amount, :less_than => 150000.01, :greater_than => 4999.99
  validates_presence_of :amount
  validates_presence_of :usage
end
