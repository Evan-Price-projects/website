class Table < ActiveRecord::Base
  has_many :cards
  has_many :users

end