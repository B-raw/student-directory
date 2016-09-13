# let's put all students into an array
@students = []

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
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
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
  student_file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    student_file.puts csv_line
  end
  student_file.close
  puts "File saved!\n\n"
end

def access_students
  student_file = File.open("students.csv", "r")
  student_file.each_line do |line|
    student = {}
    student[:name], student[:cohort] = line.chomp.split(",")
    @students << student
  end
  student_file.close
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
access_students
interactive_menu
