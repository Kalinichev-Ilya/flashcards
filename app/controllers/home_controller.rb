class HomeController < ApplicationController
  def index
    @card = Card.reviewed_between.order('RANDOM()').first
  end
end
