class LeaderboardController < ApplicationController
  before_action :require_login

  def index
    scores = QuizScore
      .joins(:user, :dance)
      .select('quiz_scores.*, users.name as user_name, dances.name as dance_name')
      .order(score: :desc)
    render json: scores.map { |s|
      {
        user_name: s.user_name,
        dance_name: s.dance_name,
        score: s.score,
        total: s.total,
        percent: ((s.score.to_f / s.total) * 100).round
      }
    }
  end
end
