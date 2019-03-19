class ErrorsAddTitle < ActiveRecord::Migration[5.2]
  def change
  	add_column :errors, :title, :string, null: false
  end
end
