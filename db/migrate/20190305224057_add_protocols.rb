class AddProtocols < ActiveRecord::Migration[5.2]
  def change
    create_table :protocols do |t|
      t.string :type
      t.timestamps null: false
    end
  end
end
