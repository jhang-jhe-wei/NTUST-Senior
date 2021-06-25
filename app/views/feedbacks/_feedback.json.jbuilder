json.extract! feedback, :id, :category, :content, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
