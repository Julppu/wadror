require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "has username and style set correctly" do
    style = Style.new name:"Lager", description:"Pale, mild"
    beer = Beer.new name:"Koff III", style: style
    beer.name.should == "Koff III"
    beer.style.name.should == "Lager"
    expect(Beer.count).to eq(0)
  end

  it "is not created without a name" do
    style = Style.new name:"Lager", description:"Pale, mild"
    beer = Beer.new name:nil, style: style
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not created without a style" do
    beer = Beer.new name:"Koff III", style:nil
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  describe "when one beer exists" do
    let(:beer){FactoryGirl.create(:beer)}

    it "is valid" do
      expect(beer).to be_valid
    end

    it "has the default style" do
      expect(beer.style.name).to eq("Lager")
    end
  end
end