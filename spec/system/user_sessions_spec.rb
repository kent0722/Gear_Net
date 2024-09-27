require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ログイン機能' do
    let(:user) { User.create(user: 'test', email: 'test@email.com', password: 'password') }
    
    it 'ログインに成功する' do
      visit login_path
      fill_in 'メールアドレス', with: 'test@email.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    it 'ログインに失敗する（パスワードが空）' do
      visit login_path
      click_button 'ログイン'
      
      expect(page).to have_content 'ログインできませんでした'
      expect(page).to have_current_path(login_path)
    end

    it 'ログインに失敗する（無効なメールアドレス）' do
      visit login_path
      fill_in 'メールアドレス', with: 'wrong@email.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      
      expect(page).to have_content 'ログインできませんでした'
      expect(page).to have_current_path(login_path)
    end

    it 'ゲストでログインする' do
      expect {
        visit login_path
        click_link 'ゲストログイン'
      }.to change(User, :count).by(1)

      expect(page).to have_content 'ログインしました'
      expect(page).to have_current_path(posts_path)
    end
  end
end