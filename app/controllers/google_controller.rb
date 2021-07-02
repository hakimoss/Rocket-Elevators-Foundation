class GoogleController < ApplicationController

    #MyApp/app/views/controllers/routers_controller.rb

#Add load_routers and replaced index with the code below
def create  
    @mapp_default = Gmaps4rails.build_markers(Address.all) do |plot, marker|  
       marker.lat plot.latitude  
       marker.lng plot.longitude     

    end  
end
def maps
    @maps_default = Gmaps4rails.build_markers(Building.all) do |maps, marker|
        building1 = Building.where(id: maps.building_detail).first
        address1 = Address.where(id: building1.address_of_the_building_id).first
        customer1 = Customer.where(id: building1.customer_id).first
        
        clientname = customer1.compagny_name
        numoffloors = 0
        numofbatteries = 0
        numofcolumns = 0 
        numofelevators = 0
        fullnameofcontact = building1.full_name_of_the_technical_contact_for_the_building

        marker.lat address1.latitude  
        marker.lng address1.longitude



        marker.infowindow render_to_string(:partial => "/google/info", :locals => {
        :numberoffloors => numoffloors,
        :clientname => clientname,
        :numberofbatteries => numofbatteries,
        :numberofcolumns => numofcolumns,
        :numberofelevators => numofelevators,
        :fullnameofcontact => fullnameofcontact

    })
    end    
end     
    def index  
        load_maps  
 
        @maps = Map.all  
    end
    # def maps
    #     @coords = []

    #     Building.all.each do |b|
    #         @coords.push([b.address_of_the_building.latitude, b.address_of_the_building.longitude])  
    #         puts "===========================" 
    #     end 
        
    # end
end
