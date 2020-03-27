require 'rails_helper'

RSpec.describe "When I visit the professors index page", type: :feature do
  it "displays all professors names, ages, and specialtys" do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.age)
    expect(page).to have_content(snape.specialty)

    expect(page).to have_content(hagarid.name)
    expect(page).to have_content(hagarid.age)
    expect(page).to have_content(hagarid.specialty)

    expect(page).to have_content(lupin.name)
    expect(page).to have_content(lupin.age)
    expect(page).to have_content(lupin.specialty)
  end

  it "displays names in alphabetical order" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    within "#all_professors" do
      expect(page).to have_content("Remus Lupin\nAge: 49\nSpecialty: Defense Against The Dark Arts\nRubus Hagarid\nAge: 38\nSpecialty: Care of Magical Creatures\nSeverus Snape\nAge: 45\nSpecialty: Potions")
    end

    #still working on testing this better, im thinking it may have to be a model test
  end
end
