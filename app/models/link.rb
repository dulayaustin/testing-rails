class Link < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :url
  validates_uniqueness_of :url

  scope :highest_votes, -> {order(Arel.sql("upvotes - downvotes DESC"))}

  def upvote
    increment!(:upvotes)
  end
end
