class EmailTemplate < ApplicationRecord


  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "template_name", "updated_at"]
  end

  def self.change_variable(content, data)
  	data.each do |key, value|
  		content.gsub!("%{#{key}}", value.to_s )
  	end
  	content
  end
end
