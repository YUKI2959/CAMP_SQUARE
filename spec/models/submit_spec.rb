require 'rails_helper'

RSpec.describe Submit, type: :model do
  before do
    @submit = FactoryBot.build(:submit)
  end

  describe 'テーマ投稿' do
    context 'テーマ投稿できる場合' do
      it 'データを全て正しく入力した場合に投稿できる' do
        expect(@submit).to be_valid
      end
    end

    context 'テーマ投稿できない場合' do
      it 'titleが空では投稿できない' do
        @submit.title = nil
        @submit.valid?
        expect(@submit.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが21文字以上の場合投稿できない' do
        @submit.title = Faker::Lorem.characters(number: 21)
        @submit.valid?
        expect(@submit.errors.full_messages).to include("Title is too long (maximum is 20 characters)")
      end
      it 'contentが空では投稿できない' do
        @submit.content = nil
        @submit.valid?
        expect(@submit.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが101文字以上の場合投稿できない' do
        @submit.content = Faker::Lorem.characters(number: 101)
        @submit.valid?
        expect(@submit.errors.full_messages).to include("Content is too long (maximum is 100 characters)")
      end
    end
  end
end
