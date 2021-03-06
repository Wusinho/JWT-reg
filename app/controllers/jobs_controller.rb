require_relative '../services/authenticate_user'

class JobsController < ApplicationController
  include AuthenticateUser
  before_action :authorized, only: %i[show update destroy]

  # GET /books
  def index
    @jobs = Job.all

    render json: @jobs
  end

  # GET /books/1
  def show
    render json: @job
  end

  def create
    @job = Job.new(job_params)
    authorize @job
    if @job.save
      render json: @job, status: :created
    else
      render json: { error: 'error' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @job.update(book_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @job.destroy
  end

  private


    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description )
      # params.permit(:title, :description )
    end
end
