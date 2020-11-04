class Person < ApplicationRecord
    
    belongs_to :locations
    belongs_to :Affiliation
    validates :Name, :Location, :Species, :Gender, :Affiliations, presence: true
    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/postgresql_adapter'
    paginates_per 10
    attr_accessor :my_csv_file
    validates :my_csv_file, :csv => true
  

    def self.my_import(file)
       
        people = []
        allowed_attributes =["Name", "Location", "Species", "Gender", "Affiliations"]
        CSV.parse(file.path, headers: true)  do |row|
            people << Person.new(row.to_h) unless row["Affiliations"].nil?
            
        end
        Person.import people, recursive: true
    end 




end

