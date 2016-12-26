target = STDIN.gets.chomp

def checkAtoZ?(str)
  str[0] == "A" && str[-1] == "Z"
end

def alternatelyAZ?(str, nxt)
  (str[-1] == "Z" && nxt == "A") || (str[-1] == "A" && nxt == "Z")
end

def chompAZ(str)
  str.split('').drop_while{|s| s != "A"}.reverse.drop_while{|s| s != "Z"}.reverse
end

r = chompAZ(target).select{|s| s == "A" || s == "Z"}.inject("Z"){|acc, s| alternatelyAZ?(acc, s) ? acc + s : acc}[1..-1]
puts r == "" ? -1 : r
