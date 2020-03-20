json.extract! error, :id, :title, :description, :serverity, :app_id, :created_at, :updated_at
json.url error_url(error, format: :json)
