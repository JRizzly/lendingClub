class CreateInputforms < ActiveRecord::Migration
  def change
    create_table :inputforms do |t|
      t.decimal :loan_amnt
      t.decimal :installment
      t.string :grade
      t.decimal :emp_length
      t.decimal :annual_inc
      t.decimal :dti
      t.decimal :fico_range_low
      t.decimal :fico_range_high
      t.decimal :number_inq_last_6months

      t.timestamps null: false
    end
  end
end
