LineNotify = Lotify::Client.new(
  client_id: ENV["LINE_NOTIFY_CLIENT_ID"],
  client_secret: ENV["LINE_NOTIFY_CLIENT_SECRET"],
  redirect_uri: ENV["LINE_NOTIFY_REDIRECT_URI"],
)
