class MyJob < ApplicationJob
  queue_as :default
  # def perform(book)
  #   @book = book
  #   book_name = @book.name
  #   Book.all.each do |book|
  #     if book.name == book_name
  #       @book.destroy
  #     end
  #   end
  # end

  def perform()
    Author.all.each do |author|
      author.update(email: "raj#{rand(100..1000)}@yopmail.com")
    end
  end
end
