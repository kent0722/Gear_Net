require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'バリデーションチェック' do
    it 'ブランド名が空の場合に無効になる' do
      post = Post.new(brand: nil, category: 'test', instrument_model: 'test', production_year: 2000, tag_list: 'test', body: 'test')
      expect(post).to be_invalid
      expect(post.errors[:brand]).to include('を入力してください')
    end

    it 'カテゴリー名が空の場合に無効になる' do
      post = Post.new(brand: 1, category: '', instrument_model: 'test', production_year: 2000, tag_list: 'test', body: 'test')
      expect(post).to be_invalid
      expect(post.errors[:category]).to include('を入力してください')
    end

    it 'カテゴリー名が最大文字数を超える場合に無効になる' do
      post = Post.new(brand: 1, category: 'max_category_name_length', instrument_model: 'test', production_year: 2000, tag_list: 'test', body: 'test')
      expect(post).to be_invalid
      expect(post.errors[:category]).to include('は15文字以内で入力してください')
    end

    it '楽器モデルが最大文字数を超える場合に無効になる' do
      post = Post.new(brand: 1, category: 'test', instrument_model: 'max-instrument_model-length', production_year: 2000, tag_list: 'test', body: 'test')
      expect(post).to be_invalid
      expect(post.errors[:instrument_model]).to include('は25文字以内で入力してください')
    end

    it '本文の最大文字数を超える場合に無効になる' do
      post = Post.new(brand: 1, category: 'test', instrument_model: 'test', production_year: 2000, tag_list: 'test', body: (1..101).to_a )
      expect(post).to be_invalid
      expect(post.errors[:body]).to include('は100文字以内で入力してください')
    end
  end

  describe 'メソッドのチェック' do
    describe '#ransackable_attributes' do
      it '許可された属性のリストを返す' do
        expected_attributes = %w[brand category instrument_model]
        expect(Post.ransackable_attributes).to match_array(expected_attributes)
      end
  
      it '許可されていない属性を含まない' do
        unexpected_attributes = %w[id user_id created_at updated_at]
        expect(Post.ransackable_attributes).not_to include(*unexpected_attributes)
      end
  
      it '空でない配列を返す' do
        expect(Post.ransackable_attributes).to be_an(Array)
        expect(Post.ransackable_attributes).not_to be_empty
      end
    end
  end
end
