class PackagesController < ApplicationController

    before_action :update_weight_from_fedex, only: [:index]

    def index
    end

    private

    def update_weight_from_fedex
        @packages = Package.all
        @packages.each { |package| package.parcel.set_over_weight_from_fedex} 
    end    
end