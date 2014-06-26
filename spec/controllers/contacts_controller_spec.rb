require 'spec_helper'

describe ContactsController do

  describe 'GET #index' do
    context 'with params[:letter]' do
      it 'populates an array of contacts starting with the letter' do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')

        get :index, letter: 'S'
        expect(assigns(:contacts)).to match_array([smith])
      end

      it 'renders the :index template' do
        get :index, letter: 'S'
        expect(response).to render_template :index
      end

    end

    context 'without the params[:letter]' do
      it 'populates an array with all the contacts' do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index
        expect(assigns(:contacts)).to match_array([smith, jones])
      end
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end


  describe 'GET #show' do
    it 'assigns the requested contact to @contact' do
      contact = create(:contact)
      get :show, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it 'renders the :show template' do
      contact = create(:contact)
      get :show, id: contact

      expect(response).to render_template :show
    end
  end


  describe 'GET #new' do
    it 'assigns a new contact to @contact' do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #edit' do

    it 'assigns the requested contact to @contact' do
      contact = create(:contact)
      get :edit, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it 'renders the :edit template' do
      contact = create(:contact)
      get :edit, id: contact
      expect(response).to render_template :edit
    end
  end


  describe 'POST #create' do
    context 'with valid attributs' do
      it 'creates a new value in the DB' do
          post :create, attributes_for(:contact)
      end
    end
  end

end