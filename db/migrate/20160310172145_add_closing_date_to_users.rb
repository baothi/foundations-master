class AddClosingDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :closing_date, :datetime
  end
end
