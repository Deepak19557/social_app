class MyClass
  def self.some_public_class_method
    puts "This is a public class method."
  end

  private_class_method def self.some_private_class_method
    puts "This is a private class method."
  end
end

Calling the public class method
MyClass.some_public_class_method

# This would raise an error because the private class method can't be called on an instance
obj = MyClass.new
obj.some_private_class_method
# MyClass.some_private_class_method


# class ClassSingleton
#
# attr_reader :name
#
# private_class_method :new
#   def initialize(name)
#       @name = name
#   end
#
#   def self.instance(name)
#     @instance ||= new(name)
#   end
# end
#
# puts ClassSingleton.instance("raju").name
# puts ClassSingleton.instance("kushwah").name
