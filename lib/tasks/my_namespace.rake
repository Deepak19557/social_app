namespace :my_namespace do
  desc "TODO"
  task task1: :environment do
    Book.second.update(language: "chinese")
  end

  desc "TODO"
  task task2: :environment do
    Book.first.update(language: "Japnese")
  end

  desc "TODO"
  task task3: :environment do
    MyJob.perform_now()
  end

  desc "Mail to Authors"
  task task4: :environment do
    MailJob.perform_now()
  end


  desc "Update"
  task task5: :environment do
    UpdateAuthorJob.perform_now()
  end

end



