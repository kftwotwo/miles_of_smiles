require 'rails_helper'

describe Product do
  it { should have_db_column :name }
  it { should have_db_column :description }
  it { should have_db_column :price }
  it { should belong_to :user }
  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
end
