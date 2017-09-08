Traitify.configure do |traitify|
  traitify.host = "https://api-sandbox.traitify.com"
  traitify.version = "v1"
  traitify.secret_key = ENV["SECRET_KEY"]
  traitify.public_key =  ENV["PUBLIC_KEY"] # Optional
  traitify.locale_key = "en-us"  # Optional
  traitify.deck_id = "core"
end
