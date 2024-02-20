namespace :my_namespace do
  desc "TODO"
  task task1: :environment do
    Book.second.update(language: "chinese")
  end

  desc "TODO"
  task task2: :environment do
    Book.first.update(language: "Japnese")
  end

end
