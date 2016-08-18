# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Subject.create(name: "ART")
Subject.create(name: "ASTR")
Subject.create(name:"CPSC")

Course.create(course_number: "205", subject_id: Subject.find_by(name:"ART").id)
Course.create(course_number: "231", subject_id: Subject.find_by(name:"ART").id)
Course.create(course_number: "233", subject_id: Subject.find_by(name:"ART").id)
Course.create(course_number: "235", subject_id: Subject.find_by(name:"ART").id)

Course.create(course_number: "207", subject_id: Subject.find_by(name:"ASTR").id)
Course.create(course_number: "209", subject_id: Subject.find_by(name:"ASTR").id)

Course.create(course_number: "413", subject_id: Subject.find_by(name:"CPSC").id)
Course.create(course_number: "449", subject_id: Subject.find_by(name:"CPSC").id)
Course.create(course_number: "457", subject_id: Subject.find_by(name:"CPSC").id)
Course.create(course_number: "329", subject_id: Subject.find_by(name:"CPSC").id)