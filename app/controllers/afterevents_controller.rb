class AftereventsController < ApplicationController

  def index
    @afterevent = Afterevent.all
  end

end
