require 'rails_helper'

describe "admin functionally" do
  before(:each) do
    @admin = FactoryGirl.create(:user, :admin => true)
    visit new_user_session_path
    fill_in 'Email', :with => @admin.email
    fill_in 'Password', :with => @admin.password_confirmation
    click_on 'Log in'
    visit products_path
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    click_on 'Logout'
    User.create(:email => 'user2@test.com', :password => '123456', :password_confirmation => '123456', :admin => false)
    visit new_user_session_path
    fill_in 'Email', :with => "user2@test.com"
    fill_in 'Password', :with => "123456"
    click_button 'Log in'
  end

  it "will test the about route as a user" do
    visit root_path
    click_on "About"
    expect(page).to have_content('About route')
  end

  it "will test the about route as a user" do
    visit root_path
    click_on "About"
    expect(page).to have_content('About route')
  end

  it "add a review as a user" do
    visit products_path
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer"
    click_on 'Enter'
    expect(page).to have_content('summer')
  end

  it "edit a review as a user" do
    visit new_product_path
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer"
    click_on 'Enter'
    click_on 'Edit'
    fill_in 'Content', :with => "summer2"
    click_on 'Enter'
    expect(page).to have_content('summer2')
  end

  it "will delete a review as a user" do
    visit new_product_path
    click_on 'winter'
    click_on 'New Review'
    fill_in 'Content', :with => "summer"
    click_on 'Enter'
    click_on 'Delete'
    expect(page).to have_content('')
  end
end
