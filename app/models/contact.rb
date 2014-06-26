class Contact < ActiveRecord::Base
  validates :firstname,:lastname, :email, presence: true
  validates :email, uniqueness: true

  def name
    [firstname, lastname].join(' ')
  end

  def self.by_letter(letter)
    where('lastname LIKE ?',"#{letter}%").order(:lastname)
  end
end