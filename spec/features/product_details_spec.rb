require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can navigate to the product detail page by clicking on a product" do

    visit root_path
    page.all(".product header a")[0].click
    expect(page).to have_css ".products-show"

    visit root_path
    page.all(".product footer a")[0].click
    expect(page).to have_css ".products-show"

  end

end
