require 'rails_helper'

RSpec.describe "Entries", :type => :request do
  describe "GET /entries.json" do
    before { @entries = FactoryGiri.create_list(:entries, 2)}

    it "should get index" do
      get entries_path format: :json

      # check staus code
      expect(response.status).to be eq 200

      # check return data
      json = JSON(response.body)
      expect(json.size).to eq @entries.count
      expect(json[0]["id"]).to eq @entries[0].id
      expect(json[1]["id"]).to eq @entries[1].id

    end
  end

  describe "GET /entries/:id.json" do
    before { @entry = FactoryGirl.create(:entry) }

    it "should get detail entry data" do
      get entry_path(@entry.id, format: :json)

      # check status code
      expect(response.status).to eq 200

      # check return data
      json = JSON.parse(response.body)
      expect(json["id"]).to    eq @entry.id
      expect(json["title"]).to eq @entry.title
      expect(json["url"]).to   eq @entry.url

    end
  end  
end
