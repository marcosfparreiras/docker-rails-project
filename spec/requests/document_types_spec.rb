require 'rails_helper'

RSpec.describe "DocumentTypes", type: :request do
  describe "GET /document_types" do
    it "works! (now write some real specs)" do
      get document_types_path
      expect(response).to have_http_status(200)
    end
  end
end
