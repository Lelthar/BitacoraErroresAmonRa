class CreateErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :errors do |t|
      t.string :code
      t.string :message
      t.string :cause
      t.string :solution
      t.string :reference
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
