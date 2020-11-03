class Location < ApplicationRecord
    has_and_belongs_to_many :person

    # require 'csv'
    # require 'activerecord-import/base'
    # require 'activerecord-import/active_record/adapters/postgresql_adapter'

  

    # def self.my_import(file)
       
    #     location = []
    #     CSV.foreach(file.path, headers: true) do |row|
    #         location << Location.new(row.to_h.slice(:attr1 => 'Locations'))
            
    #     end
    #     Location.import location, recursive: true
    # end 
    
    def search
    end
end

