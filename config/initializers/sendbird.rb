Sendbird.config do |c|
  c.applications = {PurelyPlatonic: ENV["APP_TOKEN"]}
  c.user = ENV["APP_USER"]
  c.password = ENV["APP_PASS"]
  c.default_app = :PurelyPlatonic
end
