class Person < ApplicationRecord
 
validates :Name, :Location, :Species, :Gender, :Affiliations, presence: true
require 'csv'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'
paginates_per 10

    # def another_titlecase
    #     self.split(" ").collect{|word| word[0] = word[0].upcase; word}.join(" ") unless word[0] == word[0].upcase   
    # end
    # def titleize
    #     nocaps = "-"
    #     self.split(" ").map { |word| nocaps.include?(word) ? word : word.capitalize }.join(" ")
    # end
    
# Function for importing the CSV file   
def self.my_import(file)
    people = []
    allowed_attributes =["Name", "Location", "Species", "Gender", "Affiliations"]
    CSV.foreach(file.path,{:headers => true, :encoding => 'ISO-8859-1'} ) do |row|
        names = row["Name"].split
        if names.length() == 3
        row["First"] = names[0].concat(' ').concat(names[1])
        row["Last"] = names[2]
        elsif names.length() == 2
        row["First"] = names[0]
        row["Last"] = names[1]   
        elsif names.length() == 1
        row["First"] = names[0]
    end
        people << Person.new(row.to_h) unless row["Affiliations"].nil?
end   
    Person.import people, recursive: true
 end 
end
