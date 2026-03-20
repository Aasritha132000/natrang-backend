class AddDetailsToDances < ActiveRecord::Migration[8.1]
  def change
    add_column :dances, :mudras, :text
    add_column :dances, :costumes, :text
    add_column :dances, :instruments, :text
    add_column :dances, :origin_year, :string
  end
end
