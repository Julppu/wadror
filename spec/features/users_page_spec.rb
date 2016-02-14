require 'rails_helper'

include Helpers

describe "User" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:beer3) { FactoryGirl.create :beer, name:"Sandels", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "shows ratings correctly" do
    create_ratings
    visit user_path user
    expect(page).to have_content 'Has made 3 ratings'
    expect(page).to have_content 'Sandels: 20'
  end

  it "deletes ratings correctly" do
    create_ratings
    expect(Rating.count).to eq(3)

    visit user_path user
    first(:link, 'delete').click
    expect(page).to have_content 'Has made 2 ratings'
    expect(page).to have_content 'Sandels: 20'
    expect(Rating.count).to eq(2)
  end

  it "shows correct favorite beer, style, brewery" do
    create_ratings
    visit user_path user
    expect(page).to have_content 'Beer: Sandels from the brewery Koff'
    expect(page).to have_content 'Style: Lager'
    expect(page).to have_content 'Brewery: Koff, founded 1900'
  end
end

def create_ratings
  rating_score = { 5 => "iso 3", 15 => "Karhu", 20 => "Sandels"  }
  rating_score.each do |score, name|
    visit new_rating_path
    select(name, from:'rating[beer_id]')
    fill_in('rating[score]', with:score)
    click_button 'Create Rating'
  end
end