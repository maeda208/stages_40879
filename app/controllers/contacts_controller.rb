class ContactsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :confirm, :complete, :create]

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :confirm
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to complete_contacts_path, notice: 'お問い合わせ内容を送信しました'
    else
      render :new
    end
  end

  def complete
  end

  private

def contact_params
  params.require(:contact).permit(:last_name, :first_name, :email, :message, :amount, :commission, :bank, :branch, :account).merge(user_id: current_user.id)
 end
end