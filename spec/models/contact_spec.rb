require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @contact = FactoryBot.build(:contact)
end
describe 'お問い合わせ機能' do
  context 'お問い合わせできるとき' do
    it 'email,last_name_id,first_name_idが存在すればお問い合わせできる' do
      expect(@contact).to be_valid
  end
end
  it 'emailが空では登録できない' do
    @contact.email = ''
    @contact.valid?
    expect(@contact.errors.full_messages).to include "Email can't be blank"
  end
  it 'emailは@を含まないと登録できない' do
    @contact.email = 'testmail'
    @contact.valid?
    expect(@contact.errors.full_messages).to include('Email is invalid')
  end
  it '苗字が空では登録できない' do
    @contact.last_name = ''
    @contact.valid?
    expect(@contact.errors.full_messages).to include("Last name can't be blank")
  end
  it '名前が空では登録できない' do
    @contact.first_name = ''
    @contact.valid?
    expect(@contact.errors.full_messages).to include("First name can't be blank")
  end
end
end