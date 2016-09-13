def read_self
  File.open("self-read.txt", "w") do |file|
    File.open(__FILE__, "r") do |rb_file|
      rb_file.each_line {|m| file << m }
    end
  end
end
read_self
