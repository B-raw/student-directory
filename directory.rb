student_count = 11
# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Fine Wine", "Country of birth" => "USA", "Favourite Beer" => "None"},
  {name: "Darth Vader", cohort: :november, hobbies: "Pod-racing", "Country of birth"=> "Tattooine", "Favourite Beer"=> "Mos Eisley Ale"},
  {name: "Nurse Ratched", cohort: :november, hobbies: "Lobotomies", "Country of birth"=> "USA", "Favourite Beer"=>"Craniotomy IPA"},
  {name: "Michael Corleone", cohort: :november, hobbies: "Handguns", "Country of birth"=> "USA", "Favourite Beer"=> "Godfather Ale"},
  {name: "Alex DeLarge", cohort: :november, hobbies: "Hooliganism", "Country of birth"=> "England", "Favourite Beer"=>"Nadsat Lager"},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "Evil spells", "Country of birth"=> "Oz", "Favourite Beer"=> "Green Mead"},
  {name: "Terminator", cohort: :december, hobbies: "Catchphrases", "Country of birth"=> "Skynet", "Favourite Beer"=>"Cold Metal Weissbeer"},
  {name: "Freddy Krueger", cohort: :november, hobbies: "Carving Pumpkins", "Country of birth"=> "USA", "Favourite Beer"=>"Nightmare Ale"},
  {name: "The Joker", cohort: :november, hobbies: "Putting smiles on faces", "Country of birth"=> "USA", "Favourite Beer"=> "Joker IPA"},
  {name: "Joffrey Baratheon", cohort: :december, hobbies: "Hunting Boar", "Country of birth"=> "Westeros", "Favourite Beer"=>"Valyrian Ale"},
  {name: "Norman Bates", cohort: :november, hobbies: "Chainsaws", "Country of birth"=> "USA", "Favourite Beer"=> "Crazy Horse Ale"}
]


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # while the name is not empty, repeat this code
  students = []
  while true do
    puts "Please enter the name of student #{students.count+1}:"
    # get the first name
    student = {:name => nil, :cohort => nil}
    student[:name] = gets.chomp
    break if student[:name].empty?
    puts "Please enter the cohort of #{student[:name]}"
    puts "Leave blank to default to november cohort"
    student[:cohort] = gets.chomp.downcase.to_sym
    student[:cohort] = :november if student[:cohort].empty?
    # add the student hash to the array
    students << student
    puts "Now we have #{students.count} student#{"s" if students.count > 1}"
    # get another name from the user
  end
  # return the array of students
  students
end



def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print students
  m = 0
  puts "Which cohort would you like to list?"
  wanted_cohort = gets.chomp.downcase.to_sym
  students.each do |student|
    if student[:cohort] == wanted_cohort
      puts "#{m+1}. #{students[m][:name]} (#{students[m][:cohort]} cohort)".center(60)
      m+=1
    end
  end
end

#old print function
=begin
def print(students)
  students.each_with_index do |student, idx|
    puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    #=> for selecting a name beginning with a specific character
    #puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == "A"

    #=> for selecting a name shorter than 12 characters
    #puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  end
end
=end

def print_footer(names)
  puts "\n"
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
