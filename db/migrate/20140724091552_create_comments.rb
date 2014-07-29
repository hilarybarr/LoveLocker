class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
      t.string :content
      t.references :note
      t.references :lover
      t.timestamps
    end
  end
end
