class SpeechesController < ApplicationController

  def index
    @speeches = Speeches.all
    render :index
  end

end
