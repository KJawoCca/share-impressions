require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#create' do
    before do
      @review = FactoryBot.build(:review)
    end
    context 'レビューが正常に投稿できるとき' do
      it "レビュータイトル、レビュー本文、作品名、作者名の各項目が正常に入力されていれば投稿できること" do
        expect(@review).to be_valid
      end
    end
    context 'レビューが正常に投稿できないとき' do
      it "レビュータイトルが空では投稿できないこと" do
        @review.title = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Title can't be blank")
      end
      it "レビュー本文が空では投稿できないこと" do
        @review.text = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Text can't be blank")
      end
      it "作品名の欄が空では投稿できないこと" do
        @review.opus_title = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Opus title can't be blank")
      end
      it "作者名の欄が空では投稿できないこと" do
        @review.author_name = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Author name can't be blank")
      end
      it "ユーザーが紐付いていなければ投稿できないこと" do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('User must exist')
      end
    end
  end
end
