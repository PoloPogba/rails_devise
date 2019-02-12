FactoryBot.define do
    factory :attendance do
      stripe_customer_id { "1244AED" }
      event { FactoryBot.create(:event) }
      user { FactoryBot.create(:user) }
    end
  end