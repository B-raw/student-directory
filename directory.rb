# let's put all students into an array
@students = [
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

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # while the name is not empty, repeat this code
 while true do
    puts "Please enter the name of student #{@students.count+1}:"
    # get the first name
    student = {:name => nil, :cohort => nil}
    student[:name] = gets.chomp
    break if student[:name].empty?
    puts "Please enter the cohort of #{student[:name]}"
    puts "Leave blank to default to november cohort"
    student[:cohort] = gets.chomp.downcase.to_sym
    student[:cohort] = :november if student[:cohort].empty?
    # add the student hash to the array
    @students << student
    puts "Now we have #{@students.count} student#{"s" if @students.count > 1}"
    # get another name from the user
  end
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.empty?
    puts "There are no students to display"
  else
    m = 0
    puts "Which cohort would you like to list? (Leave blank to display all students)"
    wanted_cohort = gets.chomp.downcase.to_sym
    @students.each do |student|
      if student[:cohort] == wanted_cohort
        puts "#{m+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
        m+=1
      elsif wanted_cohort.empty?
        puts "#{m+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
        m+=1
      end
    end
  end
end

#old print_students_list function
=begin
def print_students_list
  @students.each_with_index do |student, idx|
    puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    #=> for selecting a name beginning with a specific character
    #puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == "A"

    #=> for selecting a name shorter than 12 characters
    #puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  end
end
=end

def print_footer
  puts "\n"
  puts "Overall, we have #{@students.length} great students"
end
#nothing happens until we call the methods
interactive_menu
