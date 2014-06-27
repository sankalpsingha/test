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
    if @contact.save
      redirect_to @contact, notice: 'The contact has been saved.'
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'The contact has been updated'
    end
  end

private
  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :email)
  end



end