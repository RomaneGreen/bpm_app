class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.format = Format.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if params.has_key? 'author_id'
      params[:author_id].each do |i|
        author = Author.find(i)
        @book.authors << author
      end  
    end
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if params.has_key? 'author_id'
      @book.authors = []
      params[:author_id].each do |i|
        author = Author.find(i)
        @book.authors << author
      end  
    end
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'      
    else
      render :edit        
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.permit(:title, :release_date, :format_id, :base_price)
    end
end
