require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "has username and style set correctly" do
    beer = Beer.new name:"Koff III", style:"Lager"
    beer.name.should == "Koff III"
    beer.style.should == "Lager"
    expect(Beer.count).to eq(0)
  end

  it "is not created without a name" do
    beer = Beer.new name:nil, style:"Lager"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not created without a style" do
    beer = Beer.new name:"Koff III", style:nil
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end