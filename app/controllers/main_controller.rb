class MainController < ApplicationController

  def index
    # @speeches = Speeches.all
    render :index
  end

  def map
    # @speeches = Speeches.all
    render :map
  end

end
