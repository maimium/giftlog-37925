FactoryBot.define do
  factory :received_gift do
    r_date { Faker::Date.birthday }
    r_content { '内容' }
    r_person { '相手のお名前' }
    r_situation { 'シチュエーション' }
    r_memo { 'メモ' }
    received_id { Faker::Number.between(from: 2, to: 3) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root,'app/assets/images/present_box.png'))}

    association :user
  end
end