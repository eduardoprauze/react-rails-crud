require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "API" do

    describe "GET /api/v1/users" do
      it "returns all the users" do
        FactoryGirl.create :user, name: "Eduardo", email: "eduardo@mail.com"
        FactoryGirl.create :user, name: "Sydney", email: "sydney@mail.com"

        get "/api/v1/users", as: :json

        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        user_names = body.map { |m| m["name"] }

        expect(user_names).to match_array(["Eduardo","Sydney"])
      end
    end

    describe "GET /api/v1/users/:id" do
      it "returns a requested user" do
        user = FactoryGirl.create :user, name: "Eduardo", email: "eduardo@mail.com"

        get "/api/v1/users/#{user.id}", as: :json

        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        expect(body["name"]).to eq "Eduardo"
      end
    end

    describe "POST /api/v1/users" do
      it "creates an user" do

        post "/api/v1/users", params: {:user =>{:name => "Eduardo", :email => "eduardo@mail.com"} }, as: :json

        expect(response.status).to eq 201 # created
        expect(User.first.name).to eq "Eduardo"
      end
    end

    describe "PUT /api/v1/users" do
      it "updates an user" do
        user = FactoryGirl.create :user, name: "Eduardo", email: "eduardo@mail.com"

        put "/api/v1/users/#{user.id}", params: {:user =>{:name => "Edward", :email => "eduardo@mail.com"} }, as: :json

        expect(response.status).to eq 200
        expect(user.reload.name).to eq "Edward"
      end
    end

    describe "DELETE /api/v1/users" do
      it "deletes an user" do
        user = FactoryGirl.create :user, name: "Eduardo", email: "eduardo@mail.com"

        delete "/api/v1/users/#{user.id}", as: :json

        expect(response.status).to eq 200
        expect(User.count).to eq 0
      end
    end

  end
end
