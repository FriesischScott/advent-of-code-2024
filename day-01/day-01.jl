using DelimitedFiles

data = readdlm("day-01/example.txt", Int)

data = readdlm("day-01/input.txt", Int)

left = data[:, 1]

right = data[:, 2]

function distance(left::Vector, right::Vector)
    return sum(abs.(sort(left) .- sort(right)))
end

function similarity(left::Vector, right::Vector)

    return sum(map(l -> count(r -> r == l, right) * l, left))
end

println("Distance: $(distance(left, right))")

println("Similarity: $(similarity(left,right))")
