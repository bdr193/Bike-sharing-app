class AddEndDateToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :end_date, :date
  end
end
