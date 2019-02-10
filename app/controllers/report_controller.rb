class ReportController < ApplicationController
  def index
    fmt = Format.find_by(name: "Hardcover")
    @books = Book.published_2018.by_format(fmt)
  end
end
