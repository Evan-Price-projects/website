descriptions = [
{project_title: 'Deck of Cards',
 description: 'Working in a simulated agile scrum environment with a team of 5. We went through 3 iterations and used programming tools such as RSPEC, HTML.erb, CSS, Ruby, Rails, Github issues, Pivotal Tracker, 4 weekly scrum meetings, SimpleCov, Sqlite as production and Postgres as development, Heroku Deployment, TDD, BDD, and RESTful services. https://github.com/Evan-Price-projects/CardGame',
 images: '1.png, 2.png, 3.png, 4.png, 5.png, 6.png'},
]

descriptions.each do |description|
  Description.create!(description)
end