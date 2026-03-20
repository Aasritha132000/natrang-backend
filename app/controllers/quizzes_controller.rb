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
    correct = quiz.correct_answer == params[:answer]
    render json: { correct: correct, correct_answer: quiz.correct_answer }
  end
end
