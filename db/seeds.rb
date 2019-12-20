require 'json'

packages = JSON.parse(File.read(Rails.root.join('resources/labels.json')))

Package.delete_all
Parcel.delete_all

packages.each do |package|
    persitent_package = Package.create(package.first(2).to_h)
    persitent_package.create_parcel(package["parcel"].to_h)
end

