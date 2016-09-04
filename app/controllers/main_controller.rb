class MainController < ApplicationController

  def index
    # separate speeches and speakers? (maybe later..)
    @speeches = Speech.all
    render :index
  end

  def map
    # @speeches = Speeches.all
    render :map
  end

end
