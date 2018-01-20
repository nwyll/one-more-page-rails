require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:my_book_club) { create(:book_club) }
  let(:my_topic) { create(:topic, book_club: my_book_club) }
  let(:my_post) { create(:post, topic: my_topic) }

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to be_success
    end

    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
      expect(assigns(:post)).to eq(my_post)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to be_success
    end

    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new, params: { topic_id: my_topic.id }
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to be_success
    end

    it "renders the #edit view" do
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @post" do
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }
      post_instance = assigns(:post)

      expect(post_instance.id).to eq my_post.id
      expect(post_instance.body).to eq my_post.body
    end
  end

  describe "POST #create" do
    it "increases the number of Post by 1" do
      expect{
        post :create, params: { topic_id: my_topic.id, post: { body: Faker::Lorem.paragraph } }
      }.to change(Post, :count).by(1)
    end

    it "assigns the new post to Post.last" do
      post :create, params: { topic_id: my_topic.id, post: { body: Faker::Lorem.paragraph } }
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the created post" do
      post :create, params: { topic_id: my_topic.id, post: { body: Faker::Lorem.paragraph } }
      expect(response).to redirect_to [my_topic, Post.last]
    end
  end

  describe "PUT update" do
    it "updates the requested post with expected attributes" do
      new_body = Faker::Lorem.paragraph

      put :update, params: { topic_id: my_topic.id, id: my_post.id, post: { body: new_body } }

      updated_post = assigns(:post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.body).to eq new_body
    end

    it "redirects to the updated post" do
      new_body = Faker::Lorem.paragraph

      put :update, params: { topic_id: my_topic.id, id: my_post.id, post: { body: new_body } }
      expect(response).to redirect_to [my_topic, my_post]
    end
  end

   describe "DELETE destroy" do
    it "deletes the requested post" do
      expect {
        delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
      }.to change(Post, :count).by(-1)
    end

    it "redirects to topic page" do
      delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
      expect(response).to redirect_to [my_book_club, my_topic]
    end
  end

end
