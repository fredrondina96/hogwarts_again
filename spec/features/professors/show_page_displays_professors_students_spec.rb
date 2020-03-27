require 'rails_helper'

RSpec.describe "When I visit a Professors show page", type: :feature do
  it "displays a list of all of that professors students" do

    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

    ProfessorStudent.create(student: harry, professor: hagarid)
    ProfessorStudent.create(student: malfoy, professor: hagarid)

    visit "/professors/#{hagarid.id}"

    expect(page).to have_content(harry.name)
    expect(page).to have_content(malfoy.name)
  end
end
