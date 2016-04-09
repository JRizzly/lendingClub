class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.float :loanamount
      t.integer :term
      t.decimal :intrate
      t.integer :subgrade
      t.integer :emplength
      t.integer :homeowner
      t.integer :anualincome
      t.integer :verficationstatus
      t.integer :loanstatus
      t.integer :dti
      t.integer :ficolow
      t.integer :ficohigh
      t.integer :numinqsixmonths
      t.string :desc

      t.timestamps null: false
    end
  end
end
