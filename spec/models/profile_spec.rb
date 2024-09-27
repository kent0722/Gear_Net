require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { FactoryBot.build(:profile) }
  
  describe 'バリデーション' do
    context '楽器名' do
      it '15文字以内であれば有効' do
        profile.instrument = 'a' * 15
        expect(profile).to be_valid
      end

      it '16文字以上であれば無効' do
        profile.instrument = 'a' * 16
        expect(profile).to be_invalid
        expect(profile.errors[:instrument]).to include('は15文字以内で入力してください')
      end
    end

    context '好きな音楽' do
      it '20文字以内であれば有効' do
        profile.favorite_music = 'a' * 20
        expect(profile).to be_valid
      end

      it '21文字以上であれば無効' do
        profile.favorite_music = 'a' * 21
        expect(profile).to be_invalid
        expect(profile.errors[:favorite_music]).to include('は20文字以内で入力してください')
      end
    end

    context '好きなアーティスト' do
      it '50文字以内であれば有効' do
        profile.favorite_artist = 'a' * 50
        expect(profile).to be_valid
      end

      it '51文字以上であれば無効' do
        profile.favorite_artist = 'a' * 51
        expect(profile).to be_invalid
        expect(profile.errors[:favorite_artist]).to include('は50文字以内で入力してください')
      end
    end

    context '自己紹介' do
      it '100文字以内であれば有効' do
        profile.introduction = 'a' * 100
        expect(profile).to be_valid
      end

      it '101文字以上であれば無効' do
        profile.introduction = 'a' * 101
        expect(profile).to be_invalid
        expect(profile.errors[:introduction]).to include('は100文字以内で入力してください')
      end
    end
  end
end