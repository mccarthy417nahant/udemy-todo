class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item

      t.timestamps null: false
    end
  end
end
