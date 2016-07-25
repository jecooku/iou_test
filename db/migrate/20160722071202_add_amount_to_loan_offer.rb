class AddAmountToLoanOffer < ActiveRecord::Migration
  def change
    add_column :loan_offers, :amount, :decimal, precision: 8, scale: 2
  end
end
