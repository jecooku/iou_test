class CreateLoanOffers < ActiveRecord::Migration
  def change
    create_table :loan_offers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :term
      t.string :usage

      t.timestamps null: false
    end
  end
end
