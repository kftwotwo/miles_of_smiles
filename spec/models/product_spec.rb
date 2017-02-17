require 'rails_helper'

describe Product do
  it { should have_db_column :name }
  it { should validate_presence_of :name }
  it { should have_db_column :description }
  it { should validate_presence_of :description }
  it { should have_db_column :price }
  it { should validate_presence_of :price }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should belong_to :user }
  it { should have_many :reviews }
end
