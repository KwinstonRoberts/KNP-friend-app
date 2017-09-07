class TestController < ApplicationController
  def index
    traitify = Traitify.new(
      host: "https://api-sandbox.traitify.com",
      version: "v1",
      secret_key: ENV["SECRET_KEY"],
      public_key: ENV["PUBLIC_KEY"],
      deck_id: "core"
    )
    @assessment = traitify.create_assessment(deck_id: 'core')
  end
end
