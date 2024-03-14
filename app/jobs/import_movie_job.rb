class ImportMovieJob
  require 'csv'

  include Sidekiq::Job

  def perform(file_path)
    
    Rails.logger.info("Imported movies from file: #{file_path}")
    MovieImporterService.new.import(file_path)

    Rails.logger.info("File #{file_path} has been deleted")
    File.delete(file_path)

  rescue StandardError => e
    Rails.logger.error("Error occurred while importing movies: #{e.message}")
  end
end
