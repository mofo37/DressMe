class GreetingsController < ApplicationController
  def welcome
    @message = "Let's find something to wear today."
  end
end
