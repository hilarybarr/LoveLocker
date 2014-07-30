class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :toward
      t.string :to
      t.references :lover

      t.timestamps
    end
  end
end
