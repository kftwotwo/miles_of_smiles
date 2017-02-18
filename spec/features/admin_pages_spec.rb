require 'rails_helper'

describe "admin functionally" do
  before(:each) do
    @admin = FactoryGirl.create(:user, :admin => true)
    visit new_user_session_path
    fill_in 'Email', :with => @admin.email
    fill_in 'Password', :with => @admin.password_confirmation
    click_button 'Log in'
  end

  it "will test the about route as a user" do
    visit root_path
    click_on "About"
    expect(page).to have_content('About route')
  end

  it 'create a product' do
    visit products_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    expect(page).to have_content('winter')
  end

  it "edit a product" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    click_on 'Edit'
    fill_in 'Name', :with => "winter123"
    click_on 'Create'
    expect(page).to have_content('winter123')
  end

  it "will delete a product" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    click_on 'Delete'
    expect(page).to have_content('')
  end

  it "will add a review as a admin" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer"
    click_on 'Enter'
    expect(page).to have_content('summer')
  end

  it "will edit a review as a admin" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer"
    click_on 'Enter'
    click_on 'Edit'
    fill_in 'Content', :with => "summer2"
    click_on 'Enter'
    expect(page).to have_content('summer2')
  end

  it "will delete a review as a admin" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer"
    click_on 'Enter'
    click_on 'Delete'
    expect(page).to have_content('')
  end

  it "add a user's review and admin will edit the review" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    User.create(:email => 'user2@test.com', :password => '123456', :password_confirmation => '123456', :admin => false)
    click_on 'Logout'
    visit new_user_session_path
    fill_in 'Email', :with => 'user2@test.com'
    fill_in 'Password', :with => '123456'
    click_button 'Log in'
    visit new_product_path
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer from user"
    click_on 'Enter'
    click_on 'Logout'
    visit new_user_session_path
    fill_in 'Email', :with => @admin.email
    fill_in 'Password', :with => @admin.password_confirmation
    click_button 'Log in'
    click_on 'Products'
    click_on 'winter'
    click_on 'Edit'
    fill_in 'Content', :with => "summer from user not anymore"
    click_on 'Enter'
    expect(page).to have_content('summer from user not anymore')
  end

  it "add a user's review and admin will delete it" do
    visit new_product_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    User.create(:email => 'user2@test.com', :password => '123456', :password_confirmation => '123456', :admin => false)
    click_on 'Logout'
    visit new_user_session_path
    fill_in 'Email', :with => 'user2@test.com'
    fill_in 'Password', :with => '123456'
    click_button 'Log in'
    visit new_product_path
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer from user"
    click_on 'Enter'
    click_on 'Logout'
    visit new_user_session_path
    fill_in 'Email', :with => @admin.email
    fill_in 'Password', :with => @admin.password_confirmation
    click_button 'Log in'
    click_on 'Products'
    click_on 'winter'
    click_on 'Delete'
    expect(page).to have_content('')
  end
end
