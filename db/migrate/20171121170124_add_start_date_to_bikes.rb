class AddStartDateToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :start_date, :date
  end
end
