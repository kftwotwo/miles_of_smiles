require 'rails_helper'

describe "admin will login to create a product" do
  it 'create a product' do
    User.create(:email => 'test@test.com', :password => '123456', :password_confirmation => '123456', :admin => true)
    @admin = FactoryGirl.build(:user)
    visit products_path
    fill_in 'Email', :with => @admin.email
    fill_in 'Password', :with => @admin.password_confirmation
    click_on 'Log in'
    click_on 'New Product'
    fill_in 'Name', :with => "winter"
    fill_in 'Description', :with => "winter2"
    fill_in 'Price', :with => 3
    click_on 'Create'
    expect(page).to have_content('winter')
  end
end
