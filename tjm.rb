#!/usr/bin/ruby
require 'io/console'

$access = false
$counter = 5
$timer = 0

def ending()
  "$ Jaaa! Ni gissade rätt!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  sleep(1)
  "$ Nu ska jag bara hitta viruset och ta bort det!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  sleep(0.5)
  "$ ls -al".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  sleep(0.1)
  puts ""
  puts("drwxrwxr-x 4 IT IT 1785 apr 26 13:11 virus.exe")
  sleep(0.5)
  "$ rm -f virus.exe".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  sleep(0.5)
  "$ shutdown".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  sleep(0.5)
  puts "System shutdown..."
  sleep 999
end

def errorloop()
  while true do
    puts "SYSTEM LOCKED!!!"
    sleep(0.5)
  end
end

def timeend()
  while true do
    puts "The time is out! IT wins!!!"
    sleep(0.5)
  end
end

def trypassword()
  print "Password: "
  pass = gets.chomp
  if pass == "test"
    "...".each_char {|c| putc c ; sleep 0.3; $stdout.flush }
    puts " Access granted!"
    $access = true
    ending()
  else
    $counter = $counter - 1
    "...".each_char {|c| putc c ; sleep 0.3; $stdout.flush }
    puts " Denied!"
    sleep(0.5)
  end
end

def gameloop()
  while true do
    puts "Time passed: #{$timer} seconds | Tries left: #{$counter} "
    sleep(0.5)
    if $counter == 0
      errorloop()
    else
      trypassword()
    end
  end
end

def init()
  print "PRESS ANY KEY TO BEGIN"
  STDIN.getch
  puts ""
  "$ Hallå? Är det någon där?".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  print "$ "
  svar = gets.chomp
  "$ Åååh, är det ni som är tjänstemännen?".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  print "$ "
  svar = gets.chomp
  "$ Tack och lov för att ni är här!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ De onda IT-förmänen har återigen ställt till det för Helsingkrona.".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ Inte med en bomb som förra gången, utan med ett förfärligt virus som kommer att sprida sig mellan alla datorer på Helsingkrona.".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ Det enda sättet att stoppa deras onda planer är att hacka deras lösenord och ta bort viruset innan det hinner sprida sig!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ Jag har lyckats få fram lite ledtrådar om vad lösenordet kan vara. Framför er har ni det som jag har kommit fram till.".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ Ni har 5 minuter på er att få fram lösenordet och bara 5 försök! Jag litar på er, när ni listat ut rätt lösenord så kan jag ta bort viruset!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ Lycka till!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  puts ""
  "$ Och tiden börjar nu!".each_char {|c| putc c ; sleep 0.1; $stdout.flush }
  sleep(0.5)
  puts ""
  puts ""
  thr = Thread.new {601.times do
    $timer += 1
    sleep 1
    if $timer == 600
      timeend()
    end
  end}
end

init()
gameloop()
