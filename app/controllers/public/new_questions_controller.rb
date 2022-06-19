class Public::NewQuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc).page(params[:page]).per(4)
  end
end
