module Api
  class QuizzesController < ApplicationController

    def index
      # random = rand(1..Quiz.count)
      # @quiz = Quiz.find :first, :offset => rand(Quiz.count)

      @quiz = Quiz.order("RANDOM()").limit(1)
      #@quiz = Quiz.all

      #@quiz.
      # .replace(/\n/g, "\\\\n")
      render json: @quiz
    end

  end
end
