json.extract! kp_comment, :id, :content, :kp_user_id, :kp_post_id, :created_at, :updated_at
json.url kp_comment_url(kp_comment, format: :json)
