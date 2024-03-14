class FileService
    def self.save_temporary_file(params_file)
        return unless params_file.present?
    
        name = SecureRandom.uuid + "-" + params_file.original_filename
        Rails.logger.info("Importing movies from file: #{name}")

        path = File.join("tmp", name)
        Rails.logger.info("Temp file path: #{path}")
    
        File.open(path, "wb") { |f| f.write(params_file.read) }
        Rails.logger.info("File saved to: #{path}")

        path
      end
end