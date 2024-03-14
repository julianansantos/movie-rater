class MovieScoreImporterService
  
    def import (file_path, user_id)
        return unless File.exist?(file_path)

        Rails.logger.info("Importing scores from file: #{file_path}")
        CSV.foreach(file_path, headers: true) do |row|
            movie = Movie.find_by(title: row['title'])
            next unless movie

            Rails.logger.info("Importing score for movie: #{movie.title} and user: #{user_id}")
            user_movie = UserMovie.find_or_initialize_by(user_id: user_id, movie_id: movie.id)        
            user_movie.score = row['score'].to_i
            user_movie.save
        end
    end
end
