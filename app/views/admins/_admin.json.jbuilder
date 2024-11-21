json.extract! admin, :id, :username, :password, :email, :sign_up_date, :created_at, :updated_at
json.url admin_url(admin, format: :json)
