require 'rails_helper'

RSpec.describe "Guides", type: :request do
  describe "GET /test" do
    it "works! (now write some real specs)" do
      get guides_path(format: :line)
      expect(response).to have_http_status(200)
    end
  end
end
