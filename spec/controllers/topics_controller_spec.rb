require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:member) { create(:user) }
  let(:other_member) { create(:user, name: "Other Member", email: "other_member@bloc.io") }
  let(:admin) { create(:user, name: "Admin", email: "admin@bloc.io", role: :admin) }
  let(:my_book_club) { create(:book_club) }
  let(:my_topic) { create(:topic, book_club: my_book_club, user: member) }

  context "member" do
    before(:each) do
      member.confirm
      sign_in(member)
    end

    describe "GET #show" do
      it "returns a success response" do
        get :show, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to be_success
      end

      it "renders the #show view" do
        get :show, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to render_template :show
      end

      it "assigns my_topic to @topic" do
        get :show, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(assigns(:topic)).to eq(my_topic)
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: { book_club_id: my_book_club.id }
        expect(response).to be_success
      end

      it "renders the #new view" do
        get :new, params: { book_club_id: my_book_club.id }
        expect(response).to render_template :new
      end

      it "initializes @topic" do
        get :new, params: { book_club_id: my_book_club.id }
        expect(assigns(:topic)).not_to be_nil
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to be_success
      end

      it "renders the #edit view" do
        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to render_template :edit
      end

      it "assigns topic to be updated to @topic" do
        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        topic_instance = assigns(:topic)

        expect(topic_instance.id).to eq my_topic.id
        expect(topic_instance.name).to eq my_topic.name
        expect(topic_instance.topic_type).to eq my_topic.topic_type
      end

      it "does not allow a member to edit a topics they don't own" do
        sign_out(member)
        other_member.confirm
        sign_in(other_member)

        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "POST #create" do
      it "increases the number of Topic by 1" do
        expect {
          post :create, params: { book_club_id: my_book_club.id, topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
        }.to change(Topic, :count).by(1)
      end

      it "assigns the new topic to Topic.last" do
          post :create, params: { book_club_id: my_book_club.id, topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
          expect(assigns(:topic)).to eq Topic.last
        end

      it "redirects to the created topic" do
        post :create, params: { book_club_id: my_book_club.id, topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
        expect(response).to redirect_to [my_book_club, Topic.last]
      end
    end

    describe "PUT #update" do
      it "updates the requested topic with expected attributes" do
        new_name = Faker::Lorem.sentence
        new_topic_type = "section"

        put :update, params: { book_club_id: my_book_club.id, id: my_topic.id, topic: { name: new_name, topic_type: new_topic_type} }

        updated_topic = assigns(:topic)
        expect(updated_topic.id).to eq my_topic.id
        expect(updated_topic.name).to eq new_name
        expect(updated_topic.topic_type).to eq new_topic_type
      end

      it "redirects to the updated topic" do
        new_name = Faker::Lorem.sentence
        new_topic_type = "section"

        put :update, params: { book_club_id: my_book_club.id, id: my_topic.id, topic: { name: new_name, topic_type: new_topic_type} }
        expect(response).to redirect_to [my_book_club, my_topic]
      end

      it "does not allow a member to update a topic they don't own" do
        sign_out(member)
        other_member.confirm
        sign_in(other_member)

        new_name = Faker::Lorem.sentence
        new_topic_type = "section"

        put :update, params: { book_club_id: my_book_club.id, id: my_topic.id, topic: { name: new_name, topic_type: new_topic_type} }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "DELETE #destroy" do
      it "deletes the requested topic" do
        delete :destroy, params: { book_club_id: my_book_club.id, id: my_topic.id }
        count = Topic.where({id: my_topic.id}).size
        expect(count).to eq 0
      end

      it "redirects to the book_club page" do
        delete :destroy, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to redirect_to my_book_club
      end

      it "does not allow a member to update a topic they don't own" do
        sign_out(member)
        other_member.confirm
        sign_in(other_member)

        delete :destroy, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end
  end

  context "admin" do
    before(:each) do
      admin.confirm
      sign_in(admin)
    end

    describe "GET #show" do
      it "returns a success response" do
        get :show, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to be_success
      end

      it "renders the #show view" do
        get :show, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to render_template :show
      end

      it "assigns my_topic to @topic" do
        get :show, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(assigns(:topic)).to eq(my_topic)
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: { book_club_id: my_book_club.id }
        expect(response).to be_success
      end

      it "renders the #new view" do
        get :new, params: { book_club_id: my_book_club.id }
        expect(response).to render_template :new
      end

      it "initializes @topic" do
        get :new, params: { book_club_id: my_book_club.id }
        expect(assigns(:topic)).not_to be_nil
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to be_success
      end

      it "renders the #edit view" do
        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to render_template :edit
      end

      it "assigns topic to be updated to @topic" do
        get :edit, params: { book_club_id: my_book_club.id, id: my_topic.id }
        topic_instance = assigns(:topic)

        expect(topic_instance.id).to eq my_topic.id
        expect(topic_instance.name).to eq my_topic.name
        expect(topic_instance.topic_type).to eq my_topic.topic_type
      end
    end

    describe "POST #create" do
      it "increases the number of Topic by 1" do
        expect {
          post :create, params: { book_club_id: my_book_club.id, topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
        }.to change(Topic, :count).by(1)
      end

      it "assigns the new topic to Topic.last" do
          post :create, params: { book_club_id: my_book_club.id, topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
          expect(assigns(:topic)).to eq Topic.last
        end

      it "redirects to the created topic" do
        post :create, params: { book_club_id: my_book_club.id, topic: { name: Faker::Lorem.sentence, topic_type: "general" } }
        expect(response).to redirect_to [my_book_club, Topic.last]
      end
    end

    describe "PUT #update" do
      it "updates the requested topic with expected attributes" do
        new_name = Faker::Lorem.sentence
        new_topic_type = "section"

        put :update, params: { book_club_id: my_book_club.id, id: my_topic.id, topic: { name: new_name, topic_type: new_topic_type} }

        updated_topic = assigns(:topic)
        expect(updated_topic.id).to eq my_topic.id
        expect(updated_topic.name).to eq new_name
        expect(updated_topic.topic_type).to eq new_topic_type
      end

      it "redirects to the updated topic" do
        new_name = Faker::Lorem.sentence
        new_topic_type = "section"

        put :update, params: { book_club_id: my_book_club.id, id: my_topic.id, topic: { name: new_name, topic_type: new_topic_type} }
        expect(response).to redirect_to [my_book_club, my_topic]
      end
    end

    describe "DELETE #destroy" do
      it "deletes the requested topic" do
        delete :destroy, params: { book_club_id: my_book_club.id, id: my_topic.id }
        count = Topic.where({id: my_topic.id}).size
        expect(count).to eq 0
      end

      it "redirects to the book_club page" do
        delete :destroy, params: { book_club_id: my_book_club.id, id: my_topic.id }
        expect(response).to redirect_to my_book_club
      end
    end
  end
end
