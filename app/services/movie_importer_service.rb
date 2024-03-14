class MovieImporterService
    require 'csv'
    
    def import(file_path)
      return unless File.exist?(file_path)

      Rails.logger.info("Importing movies from file: #{file_path}")
      CSV.foreach(file_path, headers: true) do |row|
        Movie.create(title: row['title'], director: row['director'])
      end
      
      Rails.logger.info("Imported movies from file: #{file_path}")
    rescue StandardError => e
      Rails.logger.error("Error occurred while importing movies: #{e.message}")
    end
  end