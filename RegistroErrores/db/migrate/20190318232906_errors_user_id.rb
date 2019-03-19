class ErrorsUserId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :errors, :users_id, :user_id
  end
end
