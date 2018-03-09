class QuestionsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @questions = Question.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # @questions = Question.all.order("id DESC")
  end

  def new

  end

  def create
    Question.create(question: question_params[:question], user_id: current_user.id)
  end

  def destroy
    question = Question.find(params[:id])
    if question.user_id == current_user.id
      question.destroy
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.user_id == current_user.id
      question.update(question_params)
    end
  end

  private
  def question_params
    params.permit(:question)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

