json.extract! error, :id,:title, :code, :message, :cause, :solution, :reference, :user_id, :created_at, :updated_at
json.url programming_error_url(error, format: :json)
