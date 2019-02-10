require 'rails_helper.rb'

feature 'Creating a new book' do  
  context 'Create a new book' do
    scenario 'should be successful' do
      visit '/'
      click_link 'Create a new book'
      fill_in 'title', with: 'Clean Code' 
      fill_in 'release_date', with: '2009-01-01'
      fill_in 'base_price', with: '20.00'
      select 'Hardcover', from: 'Format'
      select 'Robert C. Martin', from: 'Author'
      click_button 'Create Book'
      expect(page).to have_content('Book was successfully created')
    end  

    scenario 'should not be successful' do
      visit '/'
      click_link 'Create a new book'
      fill_in 'title', with: '' 
      fill_in 'release_date', with: '2009-01-01'
      fill_in 'base_price', with: '20.00'
      select 'Hardcover', from: 'Format'
      select 'Robert C. Martin', from: 'Author'
      click_button 'Create Book'
      expect(page).to have_content("Title can't be blank")
    end  

  end
end

feature 'Updating a book' do
  context 'Update an existing book' do
    scenario 'should be successful' do
      book = Book.new(title: 'Initial title', release_date: DateTime.now)
      book.authors << Author.first
      book.format = Format.first
      book.save!
      visit edit_book_path(book)
      fill_in 'title', with: 'Updated title'
      click_button 'Update Book'
      expect(page).to have_content('Book was successfully updated')
      expect(page).to have_content('Updated title')
    end  

    scenario 'should not be successful' do
      book = Book.new(title: 'Initial title', release_date: DateTime.now)
      book.authors << Author.first
      book.format = Format.first
      book.save!
      visit edit_book_path(book)
      fill_in 'title', with: ''
      click_button 'Update Book'
      expect(page).to have_content("Title can't be blank")
    end  
  end
end

feature 'Viewing the report' do
  scenario 'can view the report' do
    visit '/report'
    expect(page).to have_content('Hardcover books published in 2018')
  end
end