require 'rails_helper'

RSpec.describe Stage, type: :model do
  before do
    @stage = FactoryBot.build(:stage)
end
describe '投稿機能' do
  context '投稿できるとき' do
    it 'reward,title,month_id,day_id,show_hour_id,end_hour_id,theater,address,conditionsが存在すれば登録できる' do
      expect(@stage).to be_valid
  end
  context '投稿できないとき' do
    it 'rewardが空では投稿できない' do
      @stage.reward = ''
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Reward can't be blank"
    end
    it 'titleが空では投稿できない' do
      @stage.title = ''
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Title can't be blank"
    end
    it 'month_idが0では投稿できない' do
      @stage.month_id = '0'
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Month must be other than 0"
    end
    it 'day_idが0では投稿できない' do
      @stage.day_id = '0'
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Day must be other than 0"
    end
    it 'show_hour_idが0では投稿できない' do
      @stage.show_hour_id = '0'
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Show hour must be other than 0"
    end
    it 'end_hour_idが0では投稿できない' do
      @stage.end_hour_id = '0'
      @stage.valid?
      expect(@stage.errors.full_messages).to include "End hour must be other than 0"
    end
    it 'theaterが空では投稿できない' do
      @stage.theater = ''
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Theater can't be blank"
    end
    it 'addressが空では投稿できない' do
      @stage.address = ''
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Address can't be blank"
    end
    it 'conditionsが空では投稿できない' do
      @stage.conditions = ''
      @stage.valid?
      expect(@stage.errors.full_messages).to include "Conditions can't be blank"
    end
  end
end
end
end