namespace :update_work do
  task my_task: :environment do
    UpdateAuthorJob.perform_now()
  end
end
