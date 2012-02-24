require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) } # make a user variable

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do
    
    before { visit signup_path }

    describe "with invalid info" do
      it "should not create a user" do
        expect { click_button "Sign up"}.not_to change(User, :count)
      end
    end

    describe "with valid info" do
      before do
        fill_in "Name", with: "Test User"
        fill_in "Email", with: "test@example.org"
        fill_in "Password", with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button "Sign up"}.to change(User, :count).by(1)
      end
    end

  end


end
