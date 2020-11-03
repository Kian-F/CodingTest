class Person < ApplicationRecord
    has_many :locations
    has_many :Affiliation
    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/postgresql_adapter'

  

    def self.my_import(file)
        expected_header = ["Name", "Location", "Species", "Gender", "Affiliations"]
        csv_error = true if !helpers.check_header(expected_header,csv_file)
       
        people = []
        CSV.foreach(file.path, headers: true) do |row|
            people << Person.new(row.to_h)
            
        end
        Person.import people, recursive: true
    end    
end

