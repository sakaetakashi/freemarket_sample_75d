FactoryBot.define do
  #新規登録・ログイン単体テスト用
  factory :address, class: Address do
    post_code         {"1000000"}
    prefecture        {"東京都"}
    city              {"港区"}
    block             {"六本木６丁目１０−１"}
    building          {"六本木ヒルズ"}
    telephone_number  {"00000000000"}
  
  end

end