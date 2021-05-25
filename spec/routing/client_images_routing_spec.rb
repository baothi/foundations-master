require "rails_helper"

RSpec.describe ClientImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/client_images").to route_to("client_images#index")
    end

    it "routes to #new" do
      expect(:get => "/client_images/new").to route_to("client_images#new")
    end

    it "routes to #show" do
      expect(:get => "/client_images/1").to route_to("client_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/client_images/1/edit").to route_to("client_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/client_images").to route_to("client_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/client_images/1").to route_to("client_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/client_images/1").to route_to("client_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/client_images/1").to route_to("client_images#destroy", :id => "1")
    end

  end
end
