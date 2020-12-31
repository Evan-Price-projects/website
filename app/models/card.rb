class Card < ActiveRecord::Base
  belongs_to :description
  belongs_to :tables
end