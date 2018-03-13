class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:id])
    @answers = current_user.answers.where(user_id: current_user.id ).order("created_at DESC")
  end

  def create
    Answer.create(answer_params)
    redirect_to controller: :answers, action: :new
  end

  private
  def answer_params
    # params.require(:answer).permit(:answer).merge(question_id: params[:id], user_id: current_user.id)
    params.permit(:answer).merge(question_id: params[:id], user_id: current_user.id)
  end
end
