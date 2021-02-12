require 'rails_helper'

RSpec.describe "Calendars", type: :request do

  describe "GET /month" do
    it "returns http success" do
      get "/calendar/month"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /week" do
    it "returns http success" do
      get "/calendar/week"
      expect(response).to have_http_status(:success)
    end
  end

end
