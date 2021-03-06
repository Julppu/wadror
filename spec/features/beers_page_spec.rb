require 'rails_helper'

include Helpers

describe "Beers page" do

  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:user) { FactoryGirl.create :user }

  it "should not have any before been created" do
    visit beers_path
    expect(page).to have_content 'Listing Beers'
    expect(page).to have_content 'Number of beers: 0'
  end

  describe "when adding a beer" do

    before :each do
      visit signin_path
      fill_in('username', with:'Pekka')
      fill_in('password', with:'Foobar1')
      click_button('Log in')
    end

    it "does not create a beer with non valid name" do
      visit new_beer_path
      select('Lager', from:'beer_style')
      select('Koff', from:'beer_brewery_id')

      expect{
        click_button('Create Beer')
      }.not_to change{Beer.count}
      expect(page).to have_content "Name can't be blank"
    end
  end

  describe "when beers exist" do
    before :each do
      @beers = ["Iso III", "Iso IVA", "Sandels"]
      beer_style = Style.new name:"Lager", description: "Pale, mild"
      @beers.each do |beer_name|
        FactoryGirl.create(:beer, name: beer_name, style: beer_style)
      end
      visit beers_path
    end

    it "lists the beers and their total number" do
      expect(page).to have_content "Number of beers: 3"
      @beers.each do |beer_name|
        expect(page).to have_content beer_name
      end
    end
  end

end