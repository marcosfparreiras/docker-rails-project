require "rails_helper"

RSpec.describe DocumentTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/document_types").to route_to("document_types#index")
    end

    it "routes to #new" do
      expect(:get => "/document_types/new").to route_to("document_types#new")
    end

    it "routes to #show" do
      expect(:get => "/document_types/1").to route_to("document_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/document_types/1/edit").to route_to("document_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/document_types").to route_to("document_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/document_types/1").to route_to("document_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/document_types/1").to route_to("document_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/document_types/1").to route_to("document_types#destroy", :id => "1")
    end

  end
end
