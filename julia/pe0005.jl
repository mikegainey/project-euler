"""
https://projecteuler.net/problem=5
Smallest multiple
Problem 5

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
"""

"""
Given an integer to factor, return an array of factors. From Euler 3.
"""
function pfactors(num::Int)
    pfactors :: Array{Int} = []
    lowerdiv = 2
    while true
        divisorfound = false
        for divisor in lowerdiv : div(num, 2)
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
    return pfactors
end

"""
1. initialize output dict
2. for x in 2:n
3. pfactors(x) -> frequency dict
4. for each key in factor dict, update output dict as needed
"""
function euler(n)
    output = Dict()
    for x in 2:n
        # make the factor dict for x
        xdict = Dict()
        for factor in pfactors(x)
            xdict[factor] = get(xdict, factor, 0) + 1
        end
        # make and update the output dict from each xfactor dict
        for (factor, frequency) in xdict
            if factor ∉ keys(output)
                output[factor] = frequency
            elseif output[factor] < frequency
                output[factor] = frequency
            end
        end
    end
    result :: Array{Int} = []
    for (factor, frequency) in output
        for i in 1:frequency
            push!(result, factor)
        end
    end
    return sort(result), prod(result)
end

function test()
    @show(euler(10))
    @show(euler(20))
    nothing
end
