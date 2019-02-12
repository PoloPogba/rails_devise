FactoryBot.define do
    factory :event do
      start_date { "2020-05-05 12:40:00" }
      duration { 50 }
      title { "Yeah bra" }
      description { "aozdkazkndpiazdnazpidakndazkndazdnkazkdpanzkdazdbkazkpdabzdkpaazdk" }
      price { 50 }
      location { "LOS ANGELOS" }
      admin {FactoryBot.create(:user)}
    end
  end