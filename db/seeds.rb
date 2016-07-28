# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Admin', email: 'admin@invento.tech', institute_id: 1, password: 'India@Greatness', about: "I'm on to something great")
puts "Added users"

Category.create(name: 'Education')
Category.create(name: 'Health')
Category.create(name: 'Employment')
Category.create(name: 'Safety')
Category.create(name: 'Agriculture')
Category.create(name: 'Environment')
Category.create(name: 'Sanitation')
Category.create(name: 'Transportation')
Category.create(name: 'Energy')
Category.create(name: 'Other')

puts "Added categories"

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seed', 'india_universities.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  ins = Institute.new
  ins.name = row['name']
  ins.location = row['location']
  ins.save
  #puts "#{ins.name}, #{ins.location} saved"
end

puts "There are now #{Institute.count} rows in the transactions table"

Idea.create(video_url: 'https://www.youtube.com/watch?v=2LnatUMwU_0', project_owner_id: 1, category_id: 8, title: 'Amphibious bicyle', description: 'Mohammad Saidullah is an inventor unlike any other you’ve ever met! His inability to meet his wife on time due to overcrowded boats made him become an inventor – and he invented an amphibious bicycle – one that runs both on land and water!Saidullah is a serial inventor and his inventions include this amphibious bicycle, Mini tractor, Spring loaded cycle, Fodder cutter operated Mini water pump, Key operated Table Fan, Conserved Energy operated bicycle and Mini turbine for electric generation. <br>Source: http://www.thebetterindia.com/9335/saidullah-inventor-amphibious-cycle/')
Idea.create(video_url: 'https://www.youtube.com/watch?v=pS-CYJb2fDI', project_owner_id: 1, category_id: 8, title: 'Tyrelessly', description: 'Tyrelessly is part of our series India Innovates that attempts to bring out the stories of some of the most brilliant minds in our country. With an aim to safely dispose end-of-life tyres, 16-year old Anubhav Wadhwa is on a mission and this is his story! If you have an end-of-life tyre that needs to be disposed, click here: http://tyrelessly.com')
Idea.create(video_url: 'https://www.youtube.com/watch?v=skMwznWdTuQ', project_owner_id: 1, category_id: 4, title: 'Smartcane for the blind', description: 'Most of us have seen visually impaired people walk using a white cane. What the white cane doesnt detect, however, is any obstruction that is above the waist. This leads to frequent upper body injuries. SmartCane is an incredible innovation addressing this and making it easier for visually impaired people to navigate through their daily life. <br>Source: Better India.')
Idea.create(video_url: 'https://www.youtube.com/watch?v=erMSo29u0p0', project_owner_id: 1, category_id: 2, title: 'The lost voices', description: 'Dr. Vishal Rao, a Bangalore based oncologist, has developed a voice prosthesis that can help throat cancer patients speak after surgery. And unlike the extremely expensive ones available in the market today, this device will cost just Rs. 50. Source: Better India')
Idea.create(video_url: 'https://www.youtube.com/watch?v=Ot0hJtEvc-c', project_owner_id: 1, category_id: 6, title: 'Edible Cutlery', description: 'When Narayana Peesapati became aware of the harmful effects of plastic, not only to the environment but also to our health when used as cutlery, he was stunned. But he did not stop there. He came up with a solution that most of us wouldn’t have thought of, and actually made it happen!')

Idea.create(video_url: 'https://www.youtube.com/watch?v=A1W-4eixSwE', project_owner_id: 1, category_id: 1, title: 'Avanti Fellows', description: 'Avanti aims at addressing the systemic bias which exists against low-income students seeking admission to India’s premier universities. India’s premier universities such as the IITs have extremely low acceptance rates of less than 2%. This has spawned a multi-billion dollar coaching industry which has in turn created a financial barrier to entry to students from low-income families. Source: The Better India')

puts "Added ideas"