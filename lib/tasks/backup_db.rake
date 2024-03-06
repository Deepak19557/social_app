# # lib/tasks/db_backup.rake
# namespace :db do
#   desc "Create a backup of the development database"
#   task backup: :environment do
#     db_config = Rails.configuration.database_configuration[Rails.env]
#     db_name = db_config['database']
#     username = db_config['username']
#     password = db_config['password']
#     backup_file = "db/backup/#{Time.now.strftime('%Y%m%d_%H%M%S')}_#{Rails.env}_backup.sql"
#
#     sh "mysqldump -u #{username} -p#{password} #{db_name} > #{backup_file}"
#   end
# end
