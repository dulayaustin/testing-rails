class Api::V1::LinksController < ApplicationController
  def index
    links = Link.highest_votes

    render json: links
  end


end