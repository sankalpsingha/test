class ContactsController < ApplicationController

  def index
    if params[:letter]
      @contacts = Contact.by_letter(params[:letter])
    else
      @contacts = Contact.order('lastname DESC')
    end
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
  end

  def show
    @contact = Contact.find(params[:id])
  end



private
  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :email)
  end



end