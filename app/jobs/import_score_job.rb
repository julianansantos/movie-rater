class ImportScoreJob
  require 'csv'
  
  include Sidekiq::Job

  def perform(file_path, user_id)

    Rails.logger.info("Importing scores from file: #{file_path}")
    MovieScoreImporterService.new.import(file_path, user_id)
  
    Rails.logger.info("File #{file_path} has been deleted")    
    File.delete(file_path)

  rescue StandardError => e
    Rails.logger.error("Error occurred while importing movies: #{e.message}")
  end
end
