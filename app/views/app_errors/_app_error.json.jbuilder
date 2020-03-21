json.extract! app_error, :id, :title, :description, :serverity, :app_id, :app_name, :created_at, :updated_at
json.url app_error_url(app_error, format: :json)
