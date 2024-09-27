require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ユーザー新規作成' do
    it '新規登録が成功する' do
      visit new_user_path  # ユーザー登録ページに移動

      fill_in 'ユーザーネーム', with: 'test'  # ユーザー名を入力
      fill_in 'メールアドレス', with: 'test@email.com'  # メールアドレスを入力
      fill_in 'パスワード', with: 'password'  # パスワードを入力
      click_button '登録する'  # 登録ボタンをクリック

      # 登録後のページ遷移や成功メッセージの確認を行う
      expect(page).to have_content '新規作成完了しました'  # 期待されるメッセージを確認
      expect(page).to have_current_path(posts_path)  # ルートパスにリダイレクトされているか確認
    end

    it '新規登録が失敗する' do
      visit new_user_path  # ユーザー登録ページに移動

      fill_in 'ユーザーネーム', with: 'max_test_name'
      fill_in 'メール', with: 'test@email.com'
      fill_in 'パスワード', with: 'password'
      click_button '登録する'

      expect(page).to have_current_path(users_path)
    end
  end
end