class Package < ApplicationRecord
    has_one :parcel
 
    def total_weight
    end

    private

    def volumetric_weight
        
    end

end
