"""
https://projecteuler.net/problem=7
10001st prime
Problem 7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?

- initialize primes = [2]
- n = 3
- loop
  - Check n's divisibility with the list of primes. If it survives, add it to primes.
  - Check the length of primes. End when it gets to the required size.
  - inc n
"""
function genprimes(len)
    primes = [2]
    n = 3
    steps = 0
    while true
        isprime = true
        for p in primes
            steps += 1
            if n % p == 0
                isprime = false
                break
            end
        end
        if isprime
            push!(primes, n)
        end
        if length(primes) == len
            break
        end
        n += 1
    end
    # return primes
    println("The $(len)th prime is $(primes[end]), found in $steps steps.")
end

