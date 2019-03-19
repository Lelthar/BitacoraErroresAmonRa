class RenameErrorsToProgrammingErrors < ActiveRecord::Migration[5.2]
  def change
  	rename_table :errors, :programming_errors
  end
end
