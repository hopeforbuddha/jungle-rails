require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name:        Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image:       open_asset("apparel1.jpg"),
        quantity:    10,
        price:       64.99
      )
    end
    @user = User.create(
      first_name:            "Test",
      last_name:             "User",
      email:                 "test@test.com",
      password:              "secret",
      password_confirmation: "secret"
    )
  end

  scenario "Users can add a product to their cart and the page shows this" do

    visit root_path
    click_on "Login"
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_on "Log in"
    page.all(".product button")[0].click
    within "nav" do
      expect(page).to have_content("Cart (1)")
    end

  end

end