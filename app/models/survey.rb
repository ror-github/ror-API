class Survey < ApplicationRecord
   validates_presence_of :title
   validates :description, presence: true
   validates :price, presence: true
end
