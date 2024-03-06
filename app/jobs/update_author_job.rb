class UpdateAuthorJob < ApplicationJob
  require 'sidekiq'

  queue_as :default

  def perform()
    debugger
    Author.last.update!(name: 'ramakant ji')  
  end

end


