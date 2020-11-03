class Person < ApplicationRecord
    require 'active_support/core_ext/string/inflections'
    belongs_to :locations
    belongs_to :Affiliation
    validates :Name, :Location, :Species, :Gender, :Affiliations, presence: true
    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/postgresql_adapter'
    paginates_per 10
  

    def self.my_import(file)
       
        people = []
        CSV.parse(file.path, headers: true)  do |row|
            people << Person.new(row.to_h) unless row["Affiliations"].nil?
            
        end
        Person.import people, recursive: true
    end 




end

