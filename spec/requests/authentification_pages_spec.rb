require 'spec_helper'

describe "Authentification" do
 
    before do
      @user=FactoryGirl.create(:user)
      @other_user=FactoryGirl.create(:user)
      @admin=FactoryGirl.create(:admin)
    end
   
    subject {page}

  describe "signin page" do

    before {visit signin_path}

    it { should have_selector('h1', text: 'Sign in') }
    it { should have_selector('title', text: full_title('Sign in')) }

  end

  describe "signin" do

    before {visit signin_path}

    describe "with invalid information" do
      before {click_button "Sign in"}
      it { should have_selector('title',text:'Sign in')}
      it { should have_selector('div.alert.alert-error', text: 'Invalid')}
    end

    describe "with valid information" do
      
      before do
        sign_in @user
      end
      it { should have_selector('title',text:@user.name)}
      it { should have_link('Profile',href: user_path(@user))}
      it { should have_link('Settings',href: edit_user_path(@user))}
      it { should have_link('Sign out',href: signout_path)}
      it { should_not have_link('Users',href: users_path)}
      it { should_not have_link('Sign in',href: signin_path)}
    end

  end

  describe "authorization" do
    
    describe "for non-signed-in users" do
      
      #let(:user){FactoryGirl.create(:user)}

      describe "when attempting to visit a signed-in-only page" do

        before do
          visit edit_user_path(@user)
          fill_in "Email",          with: @user.email
          fill_in "Password",       with: @user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit user')
          end
        end

      end

      describe "in the Users controller" do

        describe "visiting his edit page" do
          before {visit edit_user_path(@user)}
          it {should have_selector('title',text:'Sign in')}
        end
        
        describe "visiting his page" do
          before {visit user_path(@user)}
          it {should have_selector('title',text:'Sign in')}
        end

        describe "submitting to the update action" do
          before {put user_path(@user)}
          specify {response.should redirect_to(signin_path)}
        end

        describe "submitting to the get action (?)" do
          before {get user_path(@user)}
          specify {response.should redirect_to(signin_path)}
        end


      end

    end

    describe "as non-admin user" do

      #let(:user){ FactoryGirl.create(:user)}
      #let(:non_admin){ FactoryGirl.create(:user)}
      before {sign_in @user}

      describe "submitting a DELETE request to the Users#destroy action" do
        before {delete user_path(@other_user)}
        specify {response.should redirect_to(root_path)}
      end
      
      describe "visiting the user index" do
        before {visit users_path}
        it {should_not have_selector('title',text: 'All users')}
      end
        
      describe "as wrong user" do
        #let(:wrong_user){FactoryGirl.create(:user)}

        describe "visiting a show page" do
          before {visit user_path(@other_user)}
          it { should_not have_selector('title', text: @other_user.name)}
          it { should have_selector('h1', text: "360")}
        end

        describe "visiting Users#edit page" do
          before {visit edit_user_path(@other_user)}
          it {should_not have_selector('title', text:full_title('Edit user'))}
          it { should have_selector('h1', text: "360")}
        end

        describe "submitting a PUT request to the Users#update action" do
          before {put user_path(@other_user)}
          specify {response.should redirect_to(root_path)}
        end
 
      end

      describe "as an admin user" do

        #let(:admin) {FactoryGirl.create(:admin)}
        before {sign_in @admin}

        it { should have_link('Users',href: users_path)}

      end

    end

  end

end
