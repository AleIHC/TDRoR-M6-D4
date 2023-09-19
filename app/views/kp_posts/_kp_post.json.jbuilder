json.extract! kp_post, :id, :kp_user_id, :created_at, :updated_at
json.url kp_post_url(kp_post, format: :json)
