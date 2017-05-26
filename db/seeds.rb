Comment.delete_all
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

# Seeds for Users
user1 = User.create!(
    email: "eva@someemailservice.no",
    password: "qwerty",
    username: "eva_d",
    first_name: "Eva",
    last_name: "Dahlo",
    about: "In this application I have mainly worked with the project pages, sorting and searching.",
    tags: Tag.where(name: "Arts")
)
user1.image = Rails.root.join("app/assets/images/2.png").open
user1.save!

user2 = User.create!(
    email: "joakim@someemailservice.no",
    password: "qwerty",
    username: "joakim_j",
    first_name: "Joakim",
    last_name: "Jacobsen",
    about: "In this project I have worked with user authentication, the landing page, and the collaborator pages.",
    tags: Tag.where(name: "Film, TV, games")
)
user2.image = Rails.root.join("app/assets/images/3.png").open
user2.save!

user3 = User.create!(
    email: "nikita@someemailservice.no",
    password: "qwerty",
    username: "nikita_z",
    first_name: "Nikita",
    last_name: "Zhevnitskiy",
    about: "In this application I have worked mainly with testing, and with Docker and Heroku.",
    tags: Tag.where(name: "Technology")
)
user3.image = Rails.root.join("app/assets/images/1.png").open
user3.save!

# Seeds for projects
project1 = Project.create!(
    user_id: user1.id,
    title:          'Create a web page for the cafeteria',
    description:    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pharetra, nunc in accumsan dictum, sapien sem lobortis ante, luctus tempus est orci eu nisl. Vivamus justo eros, viverra vitae pellentesque nec, tincidunt nec turpis. Donec vitae dui elementum erat convallis tincidunt. Mauris vehicula quam at porta iaculis. Mauris varius lacus sed ante volutpat ullamcorper ac sed tortor. Nulla facilisi. Fusce lobortis feugiat nulla, sed gravida orci aliquam in. Vivamus sapien erat, blandit scelerisque dictum sagittis, aliquet ac neque. Integer at tempor odio, eu sagittis quam. Sed tincidunt, risus in posuere mattis, metus augue sodales nisl, sed dapibus lectus turpis in nisi.',
    contact: 'Phone: 98989898')

project2 = Project.create!(
    user_id: user2.id,
    title: 'Make a TV commercial',
    description: "Nam quis sapien nec ligula lacinia finibus dictum ut lectus. Nunc sit amet nibh sollicitudin, pharetra massa sit amet, accumsan massa. Cras vitae orci nec est pharetra facilisis quis non massa. Aenean cursus venenatis est, et elementum dolor mollis sit amet. Integer molestie iaculis aliquam. Nullam blandit efficitur ligula, eget vehicula metus finibus venenatis. Nunc sagittis, purus vitae volutpat tempus, diam diam convallis risus, eget porttitor massa arcu at tortor. Praesent tristique, massa vitae sollicitudin vulputate, lacus lectus facilisis tellus, eget gravida libero erat at nulla. Phasellus sem ex, aliquam eu enim sit amet, imperdiet tempor ligula. Quisque finibus bibendum sapien sit amet cursus. Sed et aliquet leo, a volutpat turpis. Phasellus sed nunc eu felis porta faucibus. Vivamus non elit eget elit maximus rhoncus. ",
    contact: 'cool_commercial@mymail.com')

project3 = Project.create!(
    user_id: user3.id,
    title: 'Concert for charity',
    description:"Donec lobortis nisl non pharetra vehicula. Suspendisse tempor tempus ligula. Sed quam enim, luctus vel lacus ac, dapibus tincidunt ante. Nunc eu egestas nisi, ac sollicitudin dolor. Mauris efficitur lectus et sem accumsan luctus. In rutrum tellus lorem, in consectetur magna interdum porttitor. Nam viverra, mauris et imperdiet fringilla, augue risus laoreet ex, non dapibus purus erat ut ante. Nam fermentum, est consequat faucibus viverra, lorem ligula vestibulum quam, eu tempus lectus nibh et nibh. In vitae dolor ornare, gravida lacus sit amet, consectetur leo. Suspendisse tincidunt leo vel libero tincidunt, at dignissim orci porta. ",
    contact: 'Phone: 12345678')

project4 = Project.create!(
    user_id: user1.id,
    title: 'Create a magazine about street art',
    description: " Aenean metus libero, ullamcorper non blandit quis, tempus vel arcu. Morbi eros nunc, feugiat vitae enim ornare, mattis scelerisque libero. Nunc interdum, felis sit amet aliquet interdum, mi nibh rhoncus sapien, et venenatis urna quam id diam. In hac habitasse platea dictumst. Sed finibus justo egestas ex volutpat, vitae vestibulum neque ornare. Duis et massa pellentesque, feugiat ante sit amet, tincidunt lorem. Fusce nec arcu vel nibh venenatis rhoncus. Nulla at placerat risus, a rutrum odio. Vivamus et mauris in tellus vulputate mollis eu et ex. Maecenas et consectetur odio. Vivamus blandit, magna feugiat tincidunt tincidunt, lorem sem facilisis felis, vitae pulvinar sapien lacus sed tellus. Morbi malesuada malesuada leo, et euismod nunc pretium vitae.",
    contact: "street_art@epost.no")

project5 = Project.create!(
    user_id: user2.id,
    title: 'Make a VR game',
    description: 'Praesent tristique, massa vitae sollicitudin vulputate, lacus lectus facilisis tellus, eget gravida libero erat at nulla. Phasellus sem ex, aliquam eu enim sit amet, imperdiet tempor ligula. Quisque finibus bibendum sapien sit amet cursus. Sed et aliquet leo, a volutpat turpis. Phasellus sed nunc eu felis porta faucibus. Vivamus non elit eget elit maximus rhoncus. Donec lobortis nisl non pharetra vehicula. Suspendisse tempor tempus ligula. Sed quam enim, luctus vel lacus ac, dapibus tincidunt ante. Nunc eu egestas nisi, ac sollicitudin dolor. Mauris efficitur lectus et sem accumsan luctus. In rutrum tellus lorem, in consectetur magna interdum porttitor. Nam viverra, mauris et imperdiet fringilla, augue risus laoreet ex, non dapibus purus erat ut ante. Nam fermentum, est consequat faucibus viverra, lorem ligula vestibulum quam, eu tempus lectus nibh et nibh.',
    contact: 'get-on-the-vr-train@hotmail.vr')
project5.cover = Rails.root.join("app/assets/images/vr.jpg").open
project5.save!

project6 = Project.create!(
    user_id: user3.id,
    title: 'Create a Slackbot',
    description:'Cras rutrum, velit quis molestie lobortis, dolor dui scelerisque erat, quis gravida metus sapien eu lacus. Sed quis lorem ultricies, vehicula nunc finibus, porta nunc. Mauris eu convallis diam, quis gravida leo. Donec at neque facilisis, ultricies nunc interdum, bibendum quam. Nunc luctus egestas maximus. Curabitur sodales laoreet felis ut blandit. Nunc ultrices iaculis pharetra. Donec varius sollicitudin ante eget vestibulum. Cras commodo, quam ac lobortis rutrum, ex risus consequat eros, at porttitor dolor nulla in sem. Cras commodo viverra risus, non semper felis congue ut. In mollis vulputate elit nec volutpat. Phasellus et metus dui. Morbi sed laoreet ante, eu lacinia turpis. Nulla facilisi. Integer in augue ac metus pellentesque vehicula in eget urna. Ut lorem odio, imperdiet vel diam et, efficitur consequat enim.',
    contact: 'bot@mailingservice.net')

# Seeds for project_tag
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
    project_id: project6.id,
    tag_id: tag1.id
)

# Seeds for project_tag
# UserTag.create!(
#     project_id: project6.id,
#     tag_id: tag1.id
# )
# TODO: Fix this

# Seeds for comments
Comment.create!(
    project_id: project5.id,
    user_id: user3.id,
    name: user3.first_name,
    body: "This looks very interesting. I've sent you an email."
)

Comment.create!(
    project_id: project5.id,
    user_id: user2.id,
    name: user2.first_name,
    body: "Could still use some more people with experience in 3D modeling."
)

Comment.create!(
    project_id: project6.id,
    user_id: user1.id,
    name: user1.first_name,
    body: "This looks very interesting. I've sent you an email."
)

Comment.create!(
    project_id: project1.id,
    user_id: user2.id,
    name: user2.first_name,
    body: "This looks very interesting. I've sent you an email."
)
