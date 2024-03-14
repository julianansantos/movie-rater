class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(methods: :average_score) }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def new_import_movies; end

  def import_movies
    return redirect_to movies_new_import_movies_path, notice: "No file uploaded." unless params[:file].present?
      file_path = FileService.save_temporary_file(params[:file])
  
      if file_path.present?
        Rails.logger.info("Importing movies from file: #{file_path}")
        ImportMovieJob.perform_async(file_path)
        Rails.logger.info("Job enqueued.")
        redirect_to movies_new_import_movies_path, notice: "Movies import has been scheduled."
      else
        redirect_to movies_new_import_movies_path, notice: "No file uploaded."
      end
    rescue StandardError => e
      Rails.logger.error("Error occurred while scheduling import: #{e.message}")
      redirect_to movies_new_import_movies_path, notice: "Error occurred while scheduling import: #{e.message}"
    end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
