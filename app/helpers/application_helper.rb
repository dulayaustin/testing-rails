module ApplicationHelper
  def formatted_score_for(link)
    score = Score.new(link)
    "#{score.value} (+#{score.upvotes}, -#{score.downvotes})"
  end
end
