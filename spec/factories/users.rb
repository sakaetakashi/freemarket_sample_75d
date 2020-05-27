FactoryBot.define do
  #新規登録・ログイン単体テスト用
  factory :user, class: User do
    nickname              {"abe"}
    email                 {"ddd@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"阿部"}
    first_name            {"晋三"}
    family_name_kana      {"あべ"}
    first_name_kana       {"しんぞう"}
    birthday              {"2000/01/01"}
    after(:create) do |user|
     create(:address, user_id: user.id)
    end

  end

end
