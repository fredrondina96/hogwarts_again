require "rails_helper"

RSpec.describe "When I visit the students index page", type: :feature do
  it "shows al students, and a count of their professors" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: harry, professor: snape)
    ProfessorStudent.create(student: harry, professor: hagarid)
    ProfessorStudent.create(student: harry, professor: lupin)
    ProfessorStudent.create(student: malfoy, professor: hagarid)
    ProfessorStudent.create(student: malfoy, professor: lupin)
    ProfessorStudent.create(student: longbottom, professor: snape)

    visit("/students")

    expect(page).to have_content("Harry Potter: 3")
    expect(page).to have_content("Draco Malfoy: 2")
    expect(page).to have_content("Neville Longbottom: 1")
  end
end
