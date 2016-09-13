require 'csv'
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      puts "You selected: load students"
      try_load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file of your choice"
  puts "4. Load the list from a file of your choice"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "You selected: input students\n\n"
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # while the name is not empty, repeat this code
 while true do
    puts "Please enter the name of student #{@students.count+1}:"
    # get the first name
    student = {:name => nil, :cohort => nil}
    student[:name] = STDIN.gets.chomp
    break if student[:name].empty?
    puts "Please enter the cohort of #{student[:name]}"
    puts "Leave blank to default to november cohort"
    student[:cohort] = STDIN.gets.chomp.downcase.to_sym
    student[:cohort] = :november if student[:cohort].empty?
    # add the student hash to the array
    @students << student
    puts "Now we have #{@students.count} student#{"s" if @students.count > 1}"
    # get another name from the user
  end
end


def print_header
  puts "You selected: show students\n\n"
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.empty?
    puts "There are no students to display"
  else
    m = 0
    puts "Which cohort would you like to list? (Leave blank to display all students)"
    wanted_cohort = STDIN.gets.chomp.downcase.to_sym
    @students.each do |student|
      if student[:cohort] == wanted_cohort
        puts "#{m+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)".center(60)
        m+=1
      elsif wanted_cohort.empty?
        puts "#{m+1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)".center(60)
        m+=1
      end
    end
  end
end

def save_students
  puts "You selected: save students\n\n"
  puts "What do you want to call your saved file?\n"
  print ">"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv_object|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_object << student_data
    end
  end
end

=begin #old FILE method
def save_students
  puts "You selected: save students\n\n"
  puts "What do you want to call your saved file?\n"
  print ">"
  filename = STDIN.gets.chomp
  student_file = File.open(filename, "w") do |io|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(',')
      io.puts csv_line
    end
  end
  puts "File saved!\n\n"
end
=end

def load_students(filename="students.csv")
  CSV.foreach(filename) do |row|
    name, cohort = row
    @students << {name: name, cohort: cohort.to_sym}
  end
end

=begin #old FILE method
def load_students(filename="students.csv")
  student_file = File.open(filename, "r") do |io|
    io.each_line do |line|
      name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
    end
  end
end
=end

def try_load_students
  puts "Select file to load student information from. For example: 'students.csv'"
  print ">"
  filename = STDIN.gets.chomp
  if filename.nil?
    load_students("students.csv")
    puts "Loaded default students.csv.\n\n"
    puts "Loaded #{@students.count} students from students.csv\n\n"
  elsif File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}\n\n"
  else
    puts "Sorry #{filename} doesn't exist."
    try_load_students
  end
end

=begin
def ask_for_file_to_load
  puts "Which file would you like to open? For example: 'students.csv'"
  print ">"
  filename = STDIN.gets.chomp
  if !(File.exist?(filename))
    puts "Sorry #{filename} doesn't exist."
    filename = "students.csv"
  else load_students filename
  end
end
=end

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
try_load_students
interactive_menu
