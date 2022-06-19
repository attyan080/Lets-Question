class HomesController < ApplicationController
  def top
    @questions = Question.order(created_at: :desc).take(5)
  end
end
