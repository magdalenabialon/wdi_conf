module Api
  class QuizzesController < ApplicationController

    def index
      @quiz = Quiz.first
      render json: @quiz
    end

  end
end
