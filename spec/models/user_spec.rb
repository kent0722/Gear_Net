require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'バリデーションチェック' do
    it 'ユーザー名が最大文字数を超える場合' do
      user = User.new(name: 'test_sample_user')
      expect(user).to  be_invalid
      expect(user.errors[:name]).to include('は9文字以内で入力してください')
    end

    it 'メールアドレスが重複する場合' do
      user = User.new(name: 'test_user', email: 'test@email.com', password: 'test')
      User.create(name: 'test_adm', email: 'test@email.com', password: 'test')
      expect(user).to be_invalid
      expect(user.errors[:email]).to include('はすでに存在します')
    end

    it 'パスワードが短すぎる場合' do
       user = User.new(name: 'test_user', email: 'test@email.com', password: '123')
       expect(user).to be_invalid
       expect(user.errors[:password]).to include('は4文字以上で入力してください')
    end
  end

  describe 'メソッドのチェック' do
    let!(:user) { User.create(name: 'test_user', email: 'test@email.com', password: 'test')}
    let!(:other_user) { User.create(name: 'other_user', email: 'other@email.com', password: 'other') }
    let!(:post) { Post.new(brand: 1, category: 'test', instrument_model: 'test', production_year: 2000, tag_list: 'test', body: 'test', user: user) }

    describe 'own?' do
      it 'ユーザーIDとオブジェクトを持ったユーザーIDがtrueの時' do
        expect(user.own?(post)).to be true
      end

      it 'ユーザーIDとオブジェクトを持ったユーザーDがfalseの時' do
        expect(other_user.own?(post)).to be false
      end
    end
    
    describe '#liked?' do
      it 'ユーザーがいいねをしている場合' do
        user.likes.create(post: post)
        expect(user.liked?(post)).to be true
      end

      it 'ユーザーがいいねをしていない場合' do
        expect(user.liked?(post)).to be false
      end
    end
  end
end

