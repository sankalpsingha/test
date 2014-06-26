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

    respond_to do |format|
      if @contact.save
        format.html {render :show, notice: 'The contact has been saved.'}
      end
    end

  end

  def show
    @contact = Contact.find(params[:id])
  end




end