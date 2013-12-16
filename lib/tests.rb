#rails c
#require "tests.rb"
#1)
#foxy_sequence("1",7)
# =>  ["1", "11", "21", "1211", "111221", "312211", "13112221", "1113213211"]
#
#3)
#arr = [1,2,3,5,6,7,8,9,10,12]
#lost_numbers(arr)
# => [4, 11] 


def string_parser(str)
a= []
srt_len =str.length
counter = 1
str_letter = 0
  begin
    if str[str_letter] == str[str_letter+1]
      counter += 1 
    else 
      a << counter.to_s
      counter = 1
      a << str[str_letter]
    end
    srt_len -= 1
    str_letter += 1
  end while srt_len >0
a.join("")
end



def foxy_sequence(str = "1", times = 13)
  foxy_sequence_arr = [str]
  begin
    str = string_parser(str)
    foxy_sequence_arr << str
    times -= 1
  end while times >0
  foxy_sequence_arr
end


def lost_numbers(arr)
  (1 .. arr.last).to_a - arr
end
  