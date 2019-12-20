require 'rails_helper'

RSpec.describe Package, type: :model do
  context "Create package" do
    it "create one package" do
      package = Package.create(tracking_number: "1237434821", carrier: "FEDEX")
      expect(Package.all.count).to eq(1)
    end

    it "create one package with parcel" do
      package = Package.new(tracking_number: "1237434821", carrier: "FEDEX")
      package.build_parcel(length:29.7,
        width:5,
        height:21,
        weight:2.0,
        distance_unit:"CM",
        mass_unit:"KG")
      package.save  

      expect(Package.all.count).to eq(1)
      expect(package.parcel.width).to eq(5)
    end

    it "check if total weight is correct" do
      package = Package.new(tracking_number: "1237434821", carrier: "FEDEX")
      package.build_parcel(length:29.7,
        width:5,
        height:21,
        weight:2.0,
        distance_unit:"CM",
        mass_unit:"KG")
      package.save  

      expect(Package.all.count).to eq(1)
      expect(package.parcel.total_weight).to eq(2)
    end

    it "check if total weight is correct" do
      package = Package.new(tracking_number: "1237434821", carrier: "FEDEX")
      package.build_parcel(length:30,
        width:25,
        height:10,
        weight:1.0,
        distance_unit:"CM",
        mass_unit:"KG")
      package.save  

      expect(Package.all.count).to eq(1)
      expect(package.parcel.total_weight).to eq(2)
    end

    it "check if package has overweight" do
      package = Package.new(tracking_number: "449044304137821", carrier: "FEDEX")
      package.build_parcel(length:30,
        width:25,
        height:10,
        weight:1.0,
        distance_unit:"CM",
        mass_unit:"KG")
      package.save  
      package.parcel.set_over_weight_from_fedex
      expect(package.parcel.has_overweight?).to eq(true)
      
      
    end
  end
end
