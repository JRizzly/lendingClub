class AddKToInputforms < ActiveRecord::Migration
  def change
    add_column :inputforms, :k, :integer
  end
end
