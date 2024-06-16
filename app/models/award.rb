class Award < ApplicationRecord
  belongs_to :habit
  enum :name, { medal: 0, plaque: 1, bronze: 2, silver: 3, gold: 4 }, validate: { allow_nil: true }
end
