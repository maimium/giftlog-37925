FactoryBot.define do
  factory :gave_gift do
    g_date { Faker::Date.birthday }
    g_content { '内容' }
    g_person { '相手のお名前' }
    g_shop { 'ショップ名' }
    g_situation { 'シチュエーション' }
    g_memo { 'メモ '}
    recommend_id { Faker::Number.between(from: 2, to: 3) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root,'app/assets/images/present_box.png'))}

    association :user
  end
end