class Person < ApplicationRecord
    require 'csv'
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/postgresql_adapter'

    def self.my_import(file)
        people = []
        CSV.foreach(file.path, headers: true) do |row|
            people << Person.new(row.to_h)
        end
        Person.import people, recursive: true
    end    
end
