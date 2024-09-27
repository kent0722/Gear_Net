require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
  end

  # describe 'プロフィール' do
  #   it 'プロフィールが表示できる' do
  #     visit user_profile_path(@user)
  #   end

  #   it 'プロフィールの編集に成功する' do
  #     visit edit_user_profile_path(@user)
  #     fill_in '楽器 :', with: 'ギター'
  #     fill_in '音楽ジャンル :', with: 'Jazz'
  #     fill_in 'profile_favorite_artist', with: 'test'
  #     fill_in 'profile_body', with: 'こんにちは！音楽が大好きです。'
  #     click_button '編集する'

  #     expect(page).to have_content('プロフィールが更新されました')
  #     expect(page).to have_content('ギター')
  #   end

  #   it 'プロフィールの編集に失敗する' do
  #     visit edit_user_profile_path(@user)
  #     fill_in 'profile_instrument', with: 'ギター'
  #     save_and_open_page
  #     click_button '編集する'

  #     expect(page).to have_content('プロフィールの更新に失敗しました')
  #     expect(page).to have_current_path(user_profile_path)
  #   end
  # end
end
