descriptions = [
{:header => 'Skills', :info => '1'},
    {:header => 'Experience', :info => '2'},
]

descriptions.each do |description|
  Description.create!(description)
end