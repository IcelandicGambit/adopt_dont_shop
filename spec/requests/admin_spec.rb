require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /shelters" do
    it "returns http success" do
      get "/admin/shelters"
      expect(response).to have_http_status(:success)
    end
  end

end
