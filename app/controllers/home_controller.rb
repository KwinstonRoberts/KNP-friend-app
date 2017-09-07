class HomeController < ApplicationController
  def index
    traitify = Traitify.new(
      host: "https://api-sandbox.traitify.com",
      version: "v1",
      secret_key: ENV["SECRET_KEY"],
      public_key: ENV["PUBLIC_KEY"],
      deck_id: "core-deck"
    )
    traitify.create_assessment
    @decks = traitify.decks
  end
end
