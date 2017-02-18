require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_db_column :content }
  it { should have_db_column :user_id }
  it { should have_db_column :product_id }
  it { should belong_to :user }
  it { should belong_to :product }
  it { should validate_presence_of :content }
end
