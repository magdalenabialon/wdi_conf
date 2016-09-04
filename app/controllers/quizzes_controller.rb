class QuizzesController < ApplicationController

  def index
    @speeches = Quiz.all
    render :index
  end

end
