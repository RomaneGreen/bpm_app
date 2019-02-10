class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date_time :release_date
      t.float :base_price

      t.timestamps
    end
  end
end
