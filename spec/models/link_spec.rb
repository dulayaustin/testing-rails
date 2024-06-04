# frozen_string_literal: true

describe Link do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
  end

  describe "#upvote" do
    it "increments upvotes" do
      link = build(:link, upvotes: 0)

      link.upvote

      expect(link.upvotes).to eq(1)
    end
  end

  describe "#score" do
    it "returns the upvotes minus the downvotes" do
      link = Link.new(upvotes: 2, downvotes: 1)

      expect(link.score).to eq(1)
    end
  end

  describe ".highest_votes" do
    it "sort from highest to lowest scores" do
      low_score_link = create(:link, url: 'http://testingrailsbook1.com', upvotes: 1, downvotes: 1)
      high_score_link = create(:link, url: 'http://testingrailsbook2.com', upvotes: 23, downvotes: 4)
      mid_score_link = create(:link, url: 'http://testingrailsbook3.com', upvotes: 4, downvotes: 2)

      expect(Link.highest_votes).to eq [high_score_link, mid_score_link, low_score_link]
    end
  end
end
