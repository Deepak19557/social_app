class Book < ApplicationRecord
  require 'csv'
 #  self.abstract_class = true

 # belongs_to: user

 has_many_attached :media

 #
 #  validates :name, presence: true
 #
 # def hello
 #   puts 'my name is rohan'
 # end

 def method_name
   
 end
 
 def self.import(file)
   CSV.foreach(file.path, headers: true) do |row|
     Book.create! row.to_hash
   end
 end

  def display_name
    "#{id} #{language}"
  end


 def self.ransackable_attributes(auth_object = nil)
   ["author_name", "id", "id_value", "language", "name", "media"]
 end

end
