# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProjectTag.delete_all
Tag.delete_all
Project.delete_all
User.delete_all


# Seeds for tags
tag1 = Tag.create!(name: 'Technology', cssName: 'Technology')

tag2 = Tag.create!(name: 'Film, TV, games', cssName: 'Film_TV_Games')

tag3 = Tag.create!(name: 'Arts', cssName: 'Art')

tag4 = Tag.create!(name: 'Communication', cssName: 'Communication')

tag5 = Tag.create!(name: 'Management', cssName: 'Management')


user1 = User.create!(
    email: "eva@gmail.no",
    password: "qwerty",
    username: "evawillpaginate",
    first_name: "Eva",
    last_name: "Dahlø"
)

user2 = User.create!(
    email: "joakim@gmail.no",
    password: "qwerty",
    username: "joakimdevise",
    first_name: "Joakim",
    last_name: "Jacobsen"
)

user3 = User.create!(
    email: "nikita@gmail.no",
    password: "qwerty",
    username: "nikitatest",
    first_name: "Nikita",
    last_name: "Zhevnitskiy"
)

project1 = Project.create!(
    user_id: user1.id,
    title:          'Create a web page for Nordea AS',
    description:    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
    contact: 'Phone: 98989898')
# . . .
project2 = Project.create!(
    user_id: user2.id,
    title: 'Remake of Lord of the Rings',
    description: "The Lord of the Rings is an epic high-fantasy novel written by English author J. R. R. Tolkien.
The story began as a sequel to Tolkien's 1937 fantasy novel The Hobbit, but eventually developed into a much larger work.
    Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling novels ever written,
with over 150 million copies sold.",
    contact: 'lotr_remake@yahoo.com')
# . . .

project3 = Project.create!(user_id: user3.id,
                           title: 'Concert for charity',
                           description:"Hosting a benefit concert series for your cause is one of the easiest and most rewarding
methods of raising money. Not only will you build local awareness and gain support for your organization,
but you'll also get to enjoy some great music in the process. With careful planning and effective marketing,
you'll soon be on your way to hosting successful events.",
                           contact: 'Phone: 23198738 or 34546323')

project4 = Project.create!(
    user_id: user1.id,
    title:          'Create a magazine about street art',
    description:    "Street art is visual art created in public locations,
usually unsanctioned artwork executed outside of the context of traditional art venues.
The term gained popularity during the graffiti art boom of the early 1980s and continues to be applied to subsequent incarnations.
Stencil graffiti, wheatpasted poster art or sticker art,
and street installation or sculpture are common forms of modern street art. Video projection,
yarn bombing and Lock On sculpture became popularized at the turn of the 21st century.",
    contact: "street_art_yo@gmail.com")
# . . .
project5 = Project.create!(
    user_id: user2.id,
    title: 'Merge Kristianerdals',
    description: 'Det har vært murring i studentmassen på Westerdals etter at det ble kjent at Løvenskiold-brødrene
har gått inn intensjonsavtale om å selge Westerdals til Høyskolen Kristiania.
Mens Høyskolen Kristiania-rektor Trond Blindheim er i lykkerus over det mulige oppkjøpet reagerer Westerdals
studentene på oppkjøpet ved å gjøre det de kan best: lage memes.',
    contact: 'kristianerdals@hotmail.com')
# . . .

project6 = Project.create!(
    user_id: user3.id,
    title: 'Create our new robotic overlord',
    description:'From SIRI to self-driving cars, artificial intelligence (AI) is progressing rapidly.
While science fiction often portrays AI as robots with human-like characteristics,
AI can encompass anything from Google’s search algorithms to IBM’s Watson to autonomous weapons.

Artificial intelligence today is properly known as narrow AI (or weak AI),
in that it is designed to perform a narrow task (e.g. only facial recognition or only internet searches or only driving a car).
However, the long-term goal of many researchers is to create general AI (AGI or strong AI).
While narrow AI may outperform humans at whatever its specific task is, like playing chess or solving equations,
AGI would outperform humans at nearly every cognitive task.',
    contact: 'glados@aperture.com')

ProjectTag.create!(
    project_id: project1.id,
    tag_id: tag1.id
)

ProjectTag.create!(
    project_id: project1.id,
    tag_id: tag4.id
)

ProjectTag.create!(
    project_id: project2.id,
    tag_id: tag2.id
)

ProjectTag.create!(
    project_id: project2.id,
    tag_id: tag3.id
)

ProjectTag.create!(
    project_id: project2.id,
    tag_id: tag4.id
)

ProjectTag.create!(
    project_id: project2.id,
    tag_id: tag5.id
)

ProjectTag.create!(
    project_id: project3.id,
    tag_id: tag3.id
)

ProjectTag.create!(
    project_id: project3.id,
    tag_id: tag4.id
)

ProjectTag.create!(
    project_id: project3.id,
    tag_id: tag5.id
)

ProjectTag.create!(
    project_id: project4.id,
    tag_id: tag3.id
)

ProjectTag.create!(
    project_id: project4.id,
    tag_id: tag4.id
)

ProjectTag.create!(
    project_id: project5.id,
    tag_id: tag1.id
)

ProjectTag.create!(
    project_id: project5.id,
    tag_id: tag2.id
)

ProjectTag.create!(
    project_id: project5.id,
    tag_id: tag3.id
)

ProjectTag.create!(
    project_id: project5.id,
    tag_id: tag4.id
)

ProjectTag.create!(
    project_id: project5.id,
    tag_id: tag5.id
)

ProjectTag.create!(
    project_id: project6.id,
    tag_id: tag1.id
)

