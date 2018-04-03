json.array! @new_message do |message|
  json.id         message.id
  json.user_id    message.user.id
  json.user_name  message.user.name
  json.content    message.content
  json.image      message.image_url
  json.date       message.created_at
end
