require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  describe 'ログイン' do
    let!(:user) { User.create(name: 'test_user', email: 'test@email.com', password: 'test') }

    it 'ログインに成功する' do
      post :create, params: { email: 'test@email.com', password: 'test' }
      expect(response).to redirect_to(posts_path)
      expect(flash[:notice]).to eq('ログインしました')
    end

    it 'ログインに失敗する' do
      post :create, params: { email: 'test@email.com', password: 'wrong_test' }
      expect(flash.now[:danger]).to eq('ログインできませんでした')
    end

    it 'ログアウトに成功する' do
      session[:user_id] = user.id  # ユーザーをログイン状態にするメソッド
      delete :destroy
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('ログアウトしました')
    end

    it 'ゲストログインに成功する' do
      expect {
        post :guest_login
      }.to change(User, :count).by(1)  # ゲストユーザーが作成されることを確認
      expect(response).to redirect_to(posts_path)
      expect(flash[:notice]).to eq('ゲストとしてログインしました')
    end
  end
end
