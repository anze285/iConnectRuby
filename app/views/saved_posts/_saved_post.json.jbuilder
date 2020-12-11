json.extract! saved_post, :id, :created_at, :updated_at
json.url saved_post_url(saved_post, format: :json)
