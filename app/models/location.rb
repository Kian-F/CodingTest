class Location < ApplicationRecord
    has_and_belongs_to_many :person

    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/postgresql_adapter'

  

    def self.my_import(file)
       
        people = []
        CSV.foreach(file.path, headers: true) do |row|
            locations << Location.new(row.to_h)
            
        end
        Location.import location, recursive: true
    end    
end

