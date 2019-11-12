"""
https://projecteuler.net/problem=9
Special Pythagorean triplet
Problem 9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

ans: [8,15,17] .* 25 == 200^2 + 375^2 == 425^2
- the upper bound on each of a, b, and c is 1000
- use a nested for loop to find all 1e6 combinations of a and b; from that, compute c
- if a + b + c == 1000, then c must be an Int (so c^2 must be a perfect square), so, the answer!
"""
function euler()
    steps = 0
    for a in 1 : 1000
        for b in a + 1 : 1000
            steps += 1
            # compute c with the Pythagorean theorem
            c = sqrt(a^2 + b^2)
            # check the sum of a + b + c
            if a + b + c == 1000
                @show(steps)
                println("$(a)² + $(b)² == $(trunc(Int, c))²")
                return BigInt(a * b * c)
            end
        end
    end
end
