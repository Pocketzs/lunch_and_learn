require 'rails_helper'

RSpec.describe TouristSight do
  describe '#initialize' do
    it 'exists and has attributes' do
      data = {
        :name=>"Palais du Louvre",
        :country=>"France",
        :country_code=>"fr",
        :region=>"Metropolitan France",
        :state=>"Ile-de-France",
        :city=>"Paris",
        :postcode=>"75001",
        :district=>"Paris",
        :suburb=>"1st Arrondissement",
        :city_block=>"Quartier Saint-Germain-l'Auxerrois",
        :street=>"Avenue du Général Lemonnier",
        :lon=>2.3368747442628885,
        :lat=>48.86147245,
        :formatted=>"Louvre Palace, Avenue du Général Lemonnier, 75001 Paris, France",
        :address_line1=>"Louvre Palace",
        :address_line2=>"Avenue du Général Lemonnier, 75001 Paris, France",
        :categories=>["building", "building.historic", "building.tourism", "heritage", "tourism", "tourism.attraction", "tourism.sights", "tourism.sights.castle", "wheelchair", "wheelchair.yes"],
        :details=>["details", "details.contact", "details.facilities", "details.heritage", "details.historic", "details.wiki_and_media"],
        :datasource=>
          {:sourcename=>"openstreetmap",
          :attribution=>"© OpenStreetMap contributors",
          :license=>"Open Database Licence",
          :url=>"https://www.openstreetmap.org/copyright",
          :raw=>
            {:name=>"Palais du Louvre",
            :image=>"http://upload.wikimedia.org/wikipedia/commons/6/66/Louvre_Museum_Wikimedia_Commons.jpg",
            :phone=>"+33 1 40205050",
            :osm_id=>-3262297,
            :"name:de"=>"Louvre",
            :"name:en"=>"Louvre Palace",
            :"name:ja"=>"ルーブル美術館",
            :"name:pl"=>"Luwr",
            :"name:ru"=>"Лувр",
            :"name:zh"=>"卢浮宫博物馆",
            :tourism=>"attraction",
            :website=>"https://www.louvre.fr/",
            :building=>"castle",
            :heritage=>2,
            :historic=>"castle",
            :osm_type=>"r",
            :wikidata=>"Q1075988",
            :"addr:city"=>"Paris",
            :wikipedia=>"fr:Palais du Louvre",
            :importance=>"international",
            :wheelchair=>"yes",
            :castle_type=>"stately",
            :"addr:postcode"=>75001,
            :"roof:material"=>"metal",
            :"image:panorama"=>"http://upload.wikimedia.org/wikipedia/commons/d/d2/Jardin_du_Carrousel.jpg",
            :"toilets:wheelchair"=>"yes"}},
        :place_id=>"518d1bce0ed2af02405927f526f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265"
      }
      ts = TouristSight.new(data)

      expect(ts).to be_a(TouristSight)
      expect(ts.id).to be_nil
      expect(ts.type).to eq('tourist_sight')
      expect(ts.name).to eq("Palais du Louvre")
      expect(ts.address).to eq("Louvre Palace, Avenue du Général Lemonnier, 75001 Paris, France")
      expect(ts.place_id).to eq("518d1bce0ed2af02405927f526f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")
    end
  end
end