require 'rails_helper'

RSpec.describe BookClubsController, type: :controller do
  let(:member) { create(:user) }
  let(:admin) { create(:user, name: "Admin", email: "admin@bloc.io", role: :admin) }
  let(:my_book_club) { create(:book_club) }

  context "member" do
    before(:each) do
      member.confirm
      sign_in(member)
    end

    describe "GET index" do
      it "returns a success response" do
        get :index
        expect(response).to be_success
      end

      it "assigns a current book_club to @current" do
        get :index
        expect(assigns(:current)).to eq([my_book_club])
      end

      it "assigns a past book_club to @past" do
        past_book_club = create(:book_club, start_date: Date.today.beginning_of_month.prev_month, end_date: Date.today.end_of_month.prev_month )
        get :index
        expect(assigns(:past)).to eq([past_book_club])
      end

      it "assigns an upcoming book_club to @upcoming" do
        upcoming_book_club = create(:book_club, start_date: Date.today.beginning_of_month.next_month, end_date: Date.today.end_of_month.next_month )
        get :index
        expect(assigns(:current)).to eq([my_book_club])
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        get :show, params: { id: my_book_club.id }
        expect(response).to be_success
      end

      it "renders the #show view" do
        get :show, params: { id: my_book_club.id }
        expect(response).to render_template :show
      end

      it "assigns my_book_club to @book_club" do
        get :show, params: { id: my_book_club.id }
        expect(assigns(:book_club)).to eq(my_book_club)
      end
    end

    describe "GET #new" do
      it "does not allow members to create book_clubs, returns redirect" do
        get :new
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "GET #edit" do
      it "does not allow members to edit book_clubs, returns redirect" do
        get :edit, params: { id: my_book_club.id }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "POST #create" do
      it "does not allow members to create book_clubs, returns redirect" do
        post :create, params: { book_club: my_book_club }
        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "PUT #update" do
      it "does not allow members to update book_clubs, returns redirect" do
        new_title = Faker::Lorem.sentence
        new_author = Faker::Name.name
        new_description = Faker::Lorem.paragraph
        new_start_date = DateTime.now
        new_end_date = DateTime.now
        new_cover = File.open(File.join(Rails.root,'app/assets/images/cover_art/generic_cover_2.jpg'))

        put :update, params: { id: my_book_club.id, book_club: { title: new_title, author: new_author, description: new_description, start_date: new_start_date, end_date: new_end_date, cover: new_cover } }

        expect(response).to redirect_to(request.referrer || root_path)
      end
    end

    describe "DELETE #destroy" do
      it "redirects to the book_clubs index" do
        delete :destroy, params: { id: my_book_club.id }
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
        get :show, params: { id: my_book_club.id }
        expect(response).to be_success
      end

      it "renders the #show view" do
        get :show, params: { id: my_book_club.id }
        expect(response).to render_template :show
      end

      it "assigns my_book_club to @book_club" do
        get :show, params: { id: my_book_club.id }
        expect(assigns(:book_club)).to eq(my_book_club)
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

      it "initializes @book_club" do
        get :new
        expect(assigns(:book_club)).not_to be_nil
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: { id: my_book_club.id }
        expect(response).to be_success
      end

      it "renders the #edit view" do
        get :edit, params: { id: my_book_club.id }
        expect(response).to render_template :edit
      end

      it "assigns book_club to be updated to @book_club" do
        get :edit, params: { id: my_book_club.id }
        book_club_instance = assigns(:book_club)

        expect(book_club_instance.id).to eq my_book_club.id
        expect(book_club_instance.title).to eq my_book_club.title
        expect(book_club_instance.author).to eq my_book_club.author
        expect(book_club_instance.description).to eq my_book_club.description
        expect(book_club_instance.start_date).to eq my_book_club.start_date
        expect(book_club_instance.end_date).to eq my_book_club.end_date
      end
    end

    describe "POST #create" do
      it "increases the number of BookClubs by 1" do
        expect {
          post :create, params: { book_club: my_book_club }
        }.to change(BookClub,:count).by(1)
      end

      it "assigns the new book_club to BookClub.last" do
          post :create, params: { book_club: my_book_club }
          expect(assigns(:book_club)).to eq BookClub.last
        end

      it "redirects to the created book_club" do
        post :create, params: { book_club: my_book_club }
        expect(response).to redirect_to(BookClub.last)
      end
    end

    describe "PUT #update" do
      it "updates the requested book_club with expected attributes" do
        new_title = Faker::Lorem.sentence
        new_author = Faker::Name.name
        new_description = Faker::Lorem.paragraph
        new_start_date = DateTime.now
        new_end_date = DateTime.now
        new_cover = File.open(File.join(Rails.root,'app/assets/images/cover_art/generic_cover_2.jpg'))

        put :update, params: { id: my_book_club.id, book_club: { title: new_title, author: new_author, description: new_description, start_date: new_start_date, end_date: new_end_date, cover: new_cover } }

        updated_book_club = assigns(:book_club)
        expect(updated_book_club.id).to eq my_book_club.id
        expect(updated_book_club.title).to eq new_title
        expect(updated_book_club.author).to eq new_author
        expect(updated_book_club.description).to eq new_description
        expect(updated_book_club.start_date).to eq new_start_date
        expect(updated_book_club.end_date).to eq new_end_date
        expect(updated_book_club.cover).to eq new_cover
      end

      it "redirects to the updated book_club" do
        new_title = Faker::Lorem.sentence
        new_author = Faker::Name.name
        new_description = Faker::Lorem.paragraph
        new_start_date = DateTime.now
        new_end_date = DateTime.now
        new_cover = File.open(File.join(Rails.root,'app/assets/images/cover_art/generic_cover_2.jpg'))

        put :update, params: { id: my_book_club.id, book_club: { title: new_title, author: new_author, description: new_description, start_date: new_start_date, end_date: new_end_date, cover: new_cover } }

        expect(response).to redirect_to my_book_club
      end
    end

    describe "DELETE #destroy" do
      it "deletes the requested book_club" do
        delete :destroy, params: { id: my_book_club.id }
        count = BookClub.where({id: my_book_club.id}).size
        expect(count).to eq 0
      end

      it "redirects to the book_clubs index" do
        delete :destroy, params: { id: my_book_club.id }
        expect(response).to redirect_to book_clubs_path
      end
    end
  end
end
