# 1. implement the function f(x,n) = x^n

# 2. Add code that calls the function with x=2, n=7, 
# run it (if you get the End of program was not reached error, increase the number of steps) 
# and verify the result (e.g., by using --print_memory or by adding a fake assert instruction [ap - 1] = 1111 
# and making sure the error says something like An ASSERT_EQ instruction failed: 128 != 1111).

func main():
    # Call fib(1, 1, 10).
    [ap] = 2; ap++
    [ap] = 7; ap++
    call pow

    # Make sure the 10th Fibonacci number is 144.
    [ap - 1] = 128
    ret
end

func pow(x, n) -> (res):
    jmp pow_body if n != 0
    [ap] = 1; ap++
    ret

    pow_body:
    [ap] = x; ap++
    [ap] = n - 1; ap++
    call pow
    [ap] = x * [ap - 1]; ap++
    ret
end
