require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:topic) { create(:topic) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end

    it "assigns Topic.all to topic" do
      get :index
      expect(assigns(:topics)).to eq([topic])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: topic.id }
      expect(response).to be_success
    end

    it "renders the #show view" do
      get :show, params: { id: topic.id }
      expect(response).to render_template :show
    end

    it "assigns my_topic to @topic" do
      get :show, params: { id: topic.id }
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "initializes @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: topic.id }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "creates a new Topic" do
      expect {
        post :create, params: { topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
      }.to change(Topic, :count).by(1)
    end

    it "assigns new Topic to Topic.last" do
        post :create, params: { topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
        expect(assigns(:topic)).to eq Topic.last
      end

    it "redirects to the created topic" do
      post :create, params: {topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
      expect(response).to redirect_to(Topic.last)
    end
  end

  describe "PUT #update" do
    it "updates the requested topic" do
      new_name = Faker::Lorem.sentence
      new_topic_type = "section"

      put :update, params: { id: topic.id, topic: { name: new_name, topic_type: new_topic_type} }

      updated_topic = assigns(:topic)
      expect(updated_topic.id).to eq topic.id
      expect(updated_topic.name).to eq new_name
      expect(updated_topic.topic_type).to eq new_topic_type
    end

    it "redirects to the topic" do
      put :update, params: { id: topic.id, topic: { name: new_name, topic_type: new_topic_type} }
      expect(response).to redirect_to(topic)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested topic" do
      expect {
        delete :destroy, params: {id: topic.id}
      }.to change(Topic, :count).by(-1)
    end

    it "redirects to the topics list" do
      delete :destroy, params: {id: topic.to_param}
      expect(response).to redirect_to(topics_url)
    end
  end

end
