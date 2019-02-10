class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :authors, :books do |t|
      t.integer :author_id
      t.integer :book_id
    end
  end
end
