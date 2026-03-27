class QuizzesController < ApplicationController
  before_action :require_login

  def index
    dance = Dance.find(params[:dance_id])
    quizzes = dance.quizzes.map do |q|
      {
        id: q.id,
        question: q.question,
        options: {
          a: q.option_a,
          b: q.option_b,
          c: q.option_c,
          d: q.option_d
        }
      }
    end
    render json: quizzes
  end

  def check
    quiz = Quiz.find(params[:id])
    correct = quiz.correct_answer.upcase == params[:answer].upcase
    render json: { correct: correct, correct_answer: quiz.correct_answer }
  end

  def submit_score
    QuizScore.create!(
      user_id: @current_user.id,
      dance_id: params[:dance_id],
      score: params[:score],
      total: params[:total]
    )
    render json: { message: 'Score saved!' }
  end
end
