class Public::QuestionsController < ApplicationController
  #ユーザーのログイン状態を確かめる。indexはログインしてなくても閲覧可能にしてます。
  before_action :authenticate_customer!, only: [:show, :create]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    @question.save
    redirect_to public_question_path(@question)
  end

  def index
    @questions = Question.where(customer_id: current_customer.id)
    # @question = current_customer.questions.new
  end

  def show
    @question = Question.find(params[:id])
    # @answers = @question.answers
    @answer = Answer.new
  end



  private

  def question_params
    params.require(:question).permit(:genre_id, :title, :content)
  end
end
