json.extract! page_load, :id, :user_agent, :created_at, :updated_at
json.url page_load_url(page_load, format: :json)
