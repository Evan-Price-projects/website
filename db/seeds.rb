descriptions = [
{:header => 'The Shawshank Redemption', :description => 'R'},
    {:header => 'Inception', :description => '16-Jul-2010'},
]

descriptions.each do |description|
  Description.create!(description)
end