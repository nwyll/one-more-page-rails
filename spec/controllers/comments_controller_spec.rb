require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:member) { create(:user) }
  let(:other_member) { create(:user, name: "Other Member", email: "other_member@bloc.io") }
  let(:admin) { create(:user, name: "Admin", email: "admin@bloc.io", role: :admin) }
  let(:my_book_club) { create(:book_club) }
  let(:my_topic) { create(:topic, book_club: my_book_club) }
  let(:my_post) { create(:post, topic: my_topic, user: member) }
  let(:my_comment) { create(:comment, post: my_post, user: member) }

  context "member" do
    before(:each) do
      member.confirm
      sign_in(member)
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to be_success
      end

      it "renders the #edit view" do
        get :edit, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to render_template :edit
      end

      it "assigns post to be updated to @post" do
        get :edit, params: { post_id: my_post.id, id: my_comment.id }
        comment_instance = assigns(:comment)

        expect(comment_instance.id).to eq my_comment.id
        expect(comment_instance.body).to eq my_comment.body
      end

       it "does not allow a member to edit a comment they don't own" do
         sign_out(member)
         other_member.confirm
         sign_in(other_member)

         get :edit, params: { post_id: my_post.id, id: my_comment.id }
         expect(response).to redirect_to(request.referrer || root_path)
       end
    end

    describe "POST #create" do
      it "increases the number of comments by 1" do
        expect{
          post :create, params: { post_id: my_post.id, comment: { body: Faker::Lorem.paragraph } }
        }.to change(Comment,:count).by(1)
      end

      it "redirects to the post show view" do
        post :create, params: { post_id: my_post.id, comment: { body: Faker::Lorem.paragraph } }
        expect(response).to redirect_to [my_topic, my_post]
      end
    end

    describe "PUT update" do
      it "updates the requested comment with expected attributes" do
        new_body = Faker::Lorem.paragraph

        put :update, params: { post_id: my_post.id, id: my_comment.id, comment: { body: new_body } }

        updated_comment = assigns(:comment)
        expect(updated_comment.id).to eq my_comment.id
        expect(updated_comment.body).to eq new_body
      end

      it "redirects to the post show view" do
        new_body = Faker::Lorem.paragraph

        put :update, params: { post_id: my_post.id, id: my_comment.id, comment: { body: new_body } }
        expect(response).to redirect_to [my_topic, my_post]
      end

      it "does not allow a member to update a comment they don't own" do
        sign_out(member)
        other_member.confirm
        sign_in(other_member)

        new_body = Faker::Lorem.paragraph

        put :update, params: { post_id: my_post.id, id: my_comment.id, comment: { body: new_body } }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "DELETE destroy" do
      it "deletes the requested comment" do
        delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
        count = Comment.where({id: my_comment.id}).size
        expect(count).to eq 0
      end

      it "redirects to post show view" do
        delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to redirect_to [my_topic, my_post]
      end

      it "does not allow a member to delete a comment they don't own" do
        sign_out(member)
        other_member.confirm
        sign_in(other_member)

        delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end
  end

  context "admin" do
    before do
      admin.confirm
      sign_in(admin)
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to be_success
      end

      it "renders the #edit view" do
        get :edit, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to render_template :edit
      end

      it "assigns post to be updated to @post" do
        get :edit, params: { post_id: my_post.id, id: my_comment.id }
        comment_instance = assigns(:comment)

        expect(comment_instance.id).to eq my_comment.id
        expect(comment_instance.body).to eq my_comment.body
      end
    end

    describe "POST #create" do
      it "increases the number of comments by 1" do
        expect{
          post :create, params: { post_id: my_post.id, comment: { body: Faker::Lorem.paragraph } }
        }.to change(Comment,:count).by(1)
      end

      it "redirects to the post show view" do
        post :create, params: { post_id: my_post.id, comment: { body: Faker::Lorem.paragraph } }
        expect(response).to redirect_to [my_topic, my_post]
      end
    end

    describe "PUT update" do
      it "updates the requested comment with expected attributes" do
        new_body = Faker::Lorem.paragraph

        put :update, params: { post_id: my_post.id, id: my_comment.id, comment: { body: new_body } }

        updated_comment = assigns(:comment)
        expect(updated_comment.id).to eq my_comment.id
        expect(updated_comment.body).to eq new_body
      end

      it "redirects to the post show view" do
        new_body = Faker::Lorem.paragraph

        put :update, params: { post_id: my_post.id, id: my_comment.id, comment: { body: new_body } }
        expect(response).to redirect_to [my_topic, my_post]
      end
    end

    describe "DELETE destroy" do
      it "deletes the requested comment" do
        delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
        count = Comment.where({id: my_comment.id}).size
        expect(count).to eq 0
      end

      it "redirects to post show view" do
        delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
        expect(response).to redirect_to [my_topic, my_post]
      end
    end
  end

end
