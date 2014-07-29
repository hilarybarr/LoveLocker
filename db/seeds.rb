require 'faker'

#create a few users
User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
end

#create a few technical skills
computer_skills = %w(Ruby Sinatra Rails JavaScript jQuery HTML CSS)
computer_skills.each do |skill|
  Skill.create :name => skill, :context => 'technical'
end

#create a few creative skills
design_skills = %w(Photoshop Illustrator Responsive-Design)
design_skills.each do |skill|
  Skill.create :name => skill, :context => 'creative'
end


User.first.proficiencies << Proficiency.create(skill_id: Skill.first.id, years_experience: 5, formal?: true )
User.first.proficiencies << Proficiency.create(skill_id: Skill.find(2).id, years_experience: 3, formal?: false )
User.find(2).proficiencies << Proficiency.create(skill_id: Skill.find(3).id, years_experience: 1, formal?: true )
User.find(3).proficiencies << Proficiency.create(skill_id: Skill.find(4).id, years_experience: 4, formal?: true )
User.find(3).proficiencies << Proficiency.create(skill_id: Skill.find(7).id, years_experience: 3, formal?: true )
User.find(4).proficiencies << Proficiency.create(skill_id: Skill.find(5).id, years_experience: 6, formal?: false )
User.find(5).proficiencies << Proficiency.create(skill_id: Skill.find(6).id, years_experience: 7, formal?: true )
#User.find(6).proficiencies << Proficiency.create(skill_id: Skill.find(6).id, years_experience: 9, formal?: false )
