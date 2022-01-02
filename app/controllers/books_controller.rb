require_relative '../services/authenticate_user'

class BooksController < ApplicationController
  include AuthenticateUser
  before_action :authorized, only: %i[show update destroy]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.create!(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: { error: 'error' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constrcorsaints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title).merge(user_id: current_user.id)
    end
end
