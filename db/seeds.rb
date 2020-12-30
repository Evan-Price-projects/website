descriptions = [
{project_title: 'Deck of Cards',
 description: 'Working in a simulated agile scrum environment with a team of 5. We went through 3 iterations and used programming tools such as RSPEC, HTML.erb, CSS, Ruby, Rails, Github issues, Pivotal Tracker, 4 weekly scrum meetings, SimpleCov, Sqlite as production and Postgres as development, Heroku Deployment, TDD, BDD, and RESTful services. https://github.com/Evan-Price-projects/CardGame',
 images: '1.png, 2.png, 3.png, 4.png, 5.png, 6.png'},
{project_title: 'Logical Programming Language',
 description: 'Created the start to logical programming language similar to prolog using the language Haskell. This language recognizes predicates, queries and commenting out things. It also solves simple one line predicate, query functions.',
 images: 'haskell1.png, haskell2.png'},
{project_title: 'Skills',
 description: 'Programming Languages',
 images: 'Java, Ruby, Python 2 and 3, R, Julia, C, HTML, CSS, PostgreSQL, SQLite, HTML.erb. HAML, Haskell'},
{project_title: 'Skills',
 description: 'Programming Tools',
 images: 'Jupyter Notebook, GitHub, GitLab, Sequence Diagrams, Activity Diagrams, Use Case Diagrams, Design Documentation, ruby-on-rails, Cucumber/Capybara, Rspec, Agile, REST, Eclipse, Rubymine, Intellij, VS Code, BDD, TDD, Heroku'},
{project_title: 'Skills',
 description: 'Programming Classes',
 images: 'Data Structures (Java), Algorithms (Java), Object Oriented Software Development (OOSD) (Java), Computer Organization (Assembly), Engineering Problem Solving  II  (C), Engineering Problem Solving  with R (R) , Intro to Networks and their Connections (Python 2, 3), Optimization Techniques (Julia), Software Engineering Languages and Tools(SQL, Ruby, HTML, CSS), Programming Language Concepts (Haskell)'},
{project_title: 'Skills',
 description: 'Non-Programming CS Classes',
 images: 'Discrete Structures, Numerical Calculations, Statistics, Engineering Math I-V, Physics I-II, Computational Epidemiology, Logic in Computer Science'},
]
descriptions.each do |description|
  Description.create!(description)
end