class Parcel < ApplicationRecord

    validates :length, presence: true
    validates :width, presence: true
    validates :height, presence: true
    validates :weight, presence: true
    validates :distance_unit, presence: true
    validates :mass_unit, presence: true

    CONST = 5000

    belongs_to :package

    def total_weight
        (volumetric_weight > weight ? volumetric_weight : weight).ceil
    end

    def set_over_weight_from_fedex
        self.update over_weight: calculate_over_weight if over_weight.blank?
    end

    def has_overweight?
        over_weight > 0
    end

    private

    def volumetric_weight
        calculate_volumetric_weight width, length, height 
    end

    def calculate_volumetric_weight(width, length, height)
        (width * length * height) / CONST
    end

    def fedex_volumetric_weight
        begin 
            dimesions = @@fedex.track(tracking_number: package.tracking_number)[0].details[:package_dimensions]
            fdw = calculate_volumetric_weight(
                UnitConverter.inches_to_cm(dimesions[:width].to_f),
                UnitConverter.inches_to_cm(dimesions[:length].to_f),
                UnitConverter.inches_to_cm(dimesions[:height].to_f)
            )
            fdw
        rescue Fedex::RateError => error
            
        end    
    end

    def calculate_over_weight
        fedex_volumetric_weight - total_weight
    end

    
end
