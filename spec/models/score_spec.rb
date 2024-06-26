require 'rails_helper'

RSpec.describe Score do
  describe "#upvotes" do
    it "is the upvotes on the link" do
      # link = Link.new(upvotes: 10)
      link = double(upvotes: 10, downvotes: 0)
      score = Score.new(link)

      expect(score.upvotes).to eq 10
    end
  end

  describe "#downvotes" do
    it "is the downvotes on the link" do
      # link = Link.new(downvotes: 5)
      link = double(upvotes: 0, downvotes: 5)
      score = Score.new(link)

      expect(score.downvotes).to eq 5
    end
  end

  describe "#value" do
    it "is the difference between up and down votes" do
      # link = Link.new(upvotes: 10, downvotes: 3)
      link = double(upvotes: 10, downvotes: 3)
      score = Score.new(link)

      expect(score.value).to eq 7
    end
  end

  describe "#controversial" do
    it "is true for posts where up/down votes are within %20 of each other" do
      # controversial_link = Link.new(upvotes: 10, downvotes: 9)
      controversial_link = double(upvotes: 10, downvotes: 9)
      score = Score.new(controversial_link)

      expect(score).to be_controversial
    end

    it "is false for posts where up/down votes are > %20 difference" do
      # non_controversial_link = Link.new(upvotes: 10, downvotes: 5)
      non_controversial_link = double(upvotes: 10, downvotes: 5)
      score = Score.new(non_controversial_link)

      expect(score).not_to be_controversial
    end
  end
end