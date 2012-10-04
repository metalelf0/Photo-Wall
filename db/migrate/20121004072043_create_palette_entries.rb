class CreatePaletteEntries < ActiveRecord::Migration
  def change
    create_table :palette_entries do |t|
      t.integer :color_id
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end
  end
end
