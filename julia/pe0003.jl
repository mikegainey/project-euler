"""
https://projecteuler.net/problem=3
Largest prime factor
Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

euler(91476) = ([2, 2, 3, 3, 3, 7, 11, 11], 16)
euler(13195) = ([5, 7, 13, 29], 16)
euler(600851475143) = ([71, 839, 1471, 6857], 3430)
"""
function euler(num::Int)
    pfactors :: Array{Int} = []
    lowerdiv = 2
    steps = 0
    while true
        divisorfound = false
        for divisor in lowerdiv : div(num, 2)
            steps += 1
            if num % divisor == 0
                push!(pfactors, divisor)
                num = div(num, divisor)
                lowerdiv = divisor
                divisorfound = true
                break
            end
        end
        if !divisorfound
            push!(pfactors, num)
            break
        end
    end
    return pfactors, steps
end

function test()
    @show(euler(91476))
    @show(euler(13195))
    @show(euler(600851475143))
    nothing
end
