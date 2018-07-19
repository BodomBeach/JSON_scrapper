def convert_to_hash(arr)
  h = {}
  i = 0
  arr.each do |hash|
    h[hash[hash.keys[0]]] = hash[hash.keys[1]]
  end
  h
end

temparr = [{
  "key_a" => "val_a",
  "key_b" => "val_b"
}, {
"key_c" => "val_c",
"key_d" => "val_d"
}]

p convert_to_hash(temparr)
