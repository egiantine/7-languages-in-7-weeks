#!/usr/local/bin/io

"# === 1 Implement Fibonacci" println
# Recursive
fib ::= method(num, if (num <= 2, 1, fib(num - 1) + fib(num-2)))

# Iterative:
fib ::= method(num, n1 := 0; n2 := 1; for (i, 1, num, n3 := n1 + n2; n2 := n1; n1 := n3); n3 println)


"# === 2 Override division by zero" println
Number divideby := Number getSlot("/")
Number setSlot("/", method(divisor, if (divisor == 0, 0, divideby(divisor))))
3 / 0 println
3 / 1 println


"# === 3 Find sum of 2d array" println
list(list(1, 2, 3), list(4, 5, 6), list(7, 8, 9)) flatten sum println


"# === 4 Implement myAverage" println
List myAverage := method(sum/size)
# Bonus: throw exception for non-number
try(list(1, "q") myAverage)


"# === 5 Implement prototype for 2d list" println
Matrix := List clone
Matrix dim := method(x, y, removeAll; y repeat(append(Range 1 to(x) asList() map(nil))))
Matrix set := method(x, y, value, at(y) atPut(x, value))
Matrix fill := method (for (i, 0, first size - 1, for (j, 0, size - 1, set(i, j, j*first size+i))))
m := Matrix clone
m dim(2, 4)
m fill
m println


"# === 6 Bonus transpose method" println
Matrix transpose := method(
  x := Matrix clone;
  for (i, 0, first size - 1, x append(map(j, j at(i))));
  return x
)
n := m transpose
n println


"# === 7 Serialize/deserialize" println
path := "io_matrix.txt"

f := File with(path)
f remove
f openForUpdating
f write(m serialized)
f close

# Deserialize
p := doFile(path)
p println


"# === 8 Guess random number between 1 and 100" println 
target := Random value (100) ceil
writeln("Please type in the number ", target)

10 repeat(
  guess := File standardInput readLine asNumber
  if (guess == target, "You got it!" println; return, "Nope..." println)
)