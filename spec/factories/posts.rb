FactoryBot.define do
  factory :post do
    association :user
    brand { 1 }  # 適切なブランド名を設定
    category { "test" }  # カテゴリーを適切に設定
    instrument_model { "test" }  # 楽器のモデル
    production_year { 2020 }  # 製造年
    tag_list { "ギター" }  # タグのリスト
    body { "この楽器は素晴らしいです。" }  # 本文
  end
end
