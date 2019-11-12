"""
https://projecteuler.net/problem=10
Summation of primes
Problem 10

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

Use genprimes from Euler problem 7.

julia> @time genprimes(2000000)
 54.197923 seconds (23 allocations: 3.001 MiB)
(142913828922, 11101832743 steps)

"""

function genprimes(upperbound)
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
            if n < upperbound
                push!(primes, n)
            else
                break
            end
        end
        n += 1
    end
    return sum(primes), "$(steps) steps"
end

function runtimeplot()
    # type "using Plots" in the REPL first
    x = []
    y = []
    for input in 100:100:10000
        timed = @timed genprimes(input)
        push!(x, input)
        push!(y, timed[2])
    end
    plot(x, y)
end


