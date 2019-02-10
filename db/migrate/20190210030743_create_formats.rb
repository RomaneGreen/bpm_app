class CreateFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :formats do |t|

      t.string :name

      t.timestamps
    end

    add_reference(:books, :format)

  
    
  end
end
