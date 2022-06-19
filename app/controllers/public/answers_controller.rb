class Public::AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.customer_id = current_customer.id
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to public_question_path(params[:question_id])
    else
      @question = Question.find(params[:question_id])
      render 'public/questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
