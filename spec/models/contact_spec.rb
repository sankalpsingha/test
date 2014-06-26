require 'spec_helper'

describe Contact do
  it 'is valid with a first name last name and email' do
    contact = build(:contact)
    expect(contact).to be_valid
  end

  it 'is invalid without a first name' do
    expect(Contact.new(firstname: nil)).to have(1).errors_on(:firstname)
  end

  it 'is invalid without a last name' do
    expect(Contact.new(lastname: nil)).to have(1).errors_on(:lastname)
  end

  it 'is invalid without an email address' do
    expect(Contact.new(email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid with a duplicate email address' do
    create(:contact, email: 'sankalpsingha@gmail.com')
    contact = build(:contact, email: 'sankalpsingha@gmail.com')

    expect(contact).to have(1).errors_on(:email)

  end

  it 'returns the contacts full name as a string' do
    contact = create(:contact, firstname: 'Sankalp', lastname: 'Singha')
    expect(contact.name).to eq 'Sankalp Singha'
  end

  describe 'filter lastname by letter' do

    before :each do
      @smith = create(:contact, lastname: 'Smith')
      @jones = create(:contact, lastname: 'Jones')
      @johnson = create(:contact, lastname: 'Johnson')

    end

    context 'matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter("J")).to eq [@johnson, @jones]
      end

    end

    context 'non-matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter("J")).to_not eq @smith
      end
    end

    it 'has a valid factory setup' do
      expect(build(:contact)).to be_valid
    end

  end



end