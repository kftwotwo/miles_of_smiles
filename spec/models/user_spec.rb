require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column :admin }
  it { should have_many :products }
  it { should have_many :reviews }
end
