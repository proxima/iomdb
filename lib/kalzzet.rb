@lines = IO.readlines("/var/www/dev/cmlee/IoM/lib/kalzzet.txt")

last_color = ''
last_line = 0

color_to_line = {}

for line in @lines do
  if line =~ /[Y,G,B,R]:/
    last_color = line[0,1]
    last_line = 0
    color_to_line[last_color] = []
  else
    color_to_line[last_color] << line
  end
end

input = ARGV[0]
pieces = input.split(' ')

out = ""

for piece in pieces
  color = piece[0,1]
  paragraph = piece[1,1]
  line = piece[2,1]
  word = piece[3,1]
  character = piece[4,1]
  
  new_line = ((paragraph.to_i - 1) * 4) + (line.to_i - 1)
  puts "#{new_line}"
  out << color_to_line[color][new_line].split(' ')[word.to_i - 1][character.to_i - 1, 1]
end

p out
