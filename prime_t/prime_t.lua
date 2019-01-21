#!/usr/bin/env lua

function is_prime(n)
  if debug_mode == true then print("is_prime - n:", n) end
  
  if n < 2 then return 'NIE' end

  local sqrt = math.sqrt(n)
  local divisior = 2
  if debug_mode == true then print("is_prime - sqrt:", sqrt) end
  if debug_mode == true then print("is_prime - divisior:", divisior) end
  while divisior <= sqrt do
    if (n % divisior) == 0 then return 'NIE' end
    divisior = divisior + 1
    if debug_mode == true then print("is_prime - divisior:", divisior) end
  end
  return 'TAK'
end

function main()
  local test_numbers = io.read("*number")
  local counter = 1
  if debug_mode == true then print("main - test_numbers:", test_numbers) end
  while counter <= test_numbers do
    local n = io.read("*number")
    if debug_mode == true then print("main - counter:", counter) end
    if debug_mode == true then print("main - n:", n) end
    local ret = is_prime(n)
    print(ret)
    counter = counter + 1
  end
end

-- debug_mode = true
debug_mode = false
main()
