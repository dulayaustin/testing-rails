require 'rails_helper'

RSpec.describe "links/_link.html.erb" do
  context "if the url is an image" do
    it "renders the image inline" do
      link = create(:link, url: "http://example.com/image.jpg")

      render "links/link", link: link

      expect(rendered).to have_selector "img[src='#{link.url}']"
    end
  end
end