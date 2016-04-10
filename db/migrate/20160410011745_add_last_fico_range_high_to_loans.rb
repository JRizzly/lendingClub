class AddLastFicoRangeHighToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :last_fico_range_high, :decimal
  end
end
