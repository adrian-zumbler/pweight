class Package < ApplicationRecord

    validates :tracking_number, presence: true
    validates :carrier, presence: true

    has_one :parcel
end
