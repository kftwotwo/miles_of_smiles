require 'rails_helper'

describe Product do
  it { should have_db_column :name }
  it { should have_db_column :description }
  it { should have_db_column :price }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
end
