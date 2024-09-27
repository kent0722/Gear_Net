require 'rails_helper'

RSpec.describe "Posts", type: :system do

  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
  end

  describe "投稿ページ" do
    let(:user) { User.create(user: 'test', email: 'test@email.com', password: 'password') }

    it '新規投稿が成功する' do
      visit new_post_path
      select 'Fender', from: 'ブランド名'
      fill_in '楽器のカテゴリー', with: 'test'
      fill_in '楽器のモデル', with: 'test'
      select '製造年月', with: '2020'
      fill_in 'タグ', with: 'guitar test'
      fill_in '本文', with: 'テスト投稿です'
      click_button '投稿する'

      expect(page).to have_content '投稿しました'
      expect(current_path).to have_current_path(posts_path)
    end

    it '新規投稿が失敗する' do
      visit new_post_path
      click_button '投稿する'

      expect(page).to have_content '投稿に失敗しました'
      expect(page).to have_current_path(new_post_path)
    end

    it '投稿の詳細が表示できる' do
      visit post_path(@post)
      expect(page).to have_content(@post.brand)
      expect(page).to have_content(@post.instrument_model)
      expect(page).to have_content(@post.production_year)
    end


    it '投稿の編集が成功する' do
      visit edit_post_path(@post)
      fill_in '本文', with: '編集されたテスト投稿です'
      click_button '更新'

      expect(page).to have_content '編集しました'
      expect(page).to have_content '編集されたテスト投稿です'
    end

    it '投稿の編集が失敗する' do
      visit edit_post_path(@post)
      fill_in '本文', with: ''
      click_button '更新'

      expect(page).to have_content '編集に失敗しました'
    end

    it '投稿の削除ができる' do
      visit post_path(@post)
      click_link '削除'

      expect(page).to have_content '削除しました'
      expect(current_path).to eq posts_path
    end
  end
end