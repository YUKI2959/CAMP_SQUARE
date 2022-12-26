require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'commentが存在していれば保存できる' do
        expect(@comment).to be_valid
        binding.pry
      end
    end
    context 'コメントが投稿できない場合' do
      it 'commentが空では保存できない' do
        @comment.coment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Coment can't be blank")
      end
      it 'submitが紐付いていないと保存できない' do
        @comment.submit = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Submit must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
    end
  end
end
