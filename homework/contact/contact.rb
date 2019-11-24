class Contact < ApplicationRecord
  validates :Content, presence: true
  validates :Content, length: { in: 1..140}
end
