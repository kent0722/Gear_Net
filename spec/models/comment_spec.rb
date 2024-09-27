require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションチェック' do
    it 'コメントが最大文字数を超える場合' do
      comment = Comment.new(body: (1..101).to_a)
      expect(comment).to  be_invalid
      expect(comment.errors[:body]).to include('は50文字以内で入力してください')
    end
  end
end
