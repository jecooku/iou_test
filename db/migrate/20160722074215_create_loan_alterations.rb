class CreateLoanAlterations < ActiveRecord::Migration
  def change
    create_table :loan_alterations do |t|
      t.references :loan_offer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
