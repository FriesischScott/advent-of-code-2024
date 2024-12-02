using DelimitedFiles
using InvertedIndices

# file = "day-02/example.txt"

file = "day-02/input.txt"

lines = filter(!isempty, readlines(file))

function parsereport(l::String)
@show l
    return parse.(Int, split(l, ' '))
end

reports = map(parsereport, lines)

function issafe(report::AbstractVector{Int64})
    difference = report[1:end-1] .- report[2:end]
    if !allequal(sign.(difference))
        return false
    else
        return all(0 .< abs.(difference) .< 4)
    end
end

function issafe2(report::AbstractVector{Int64})
    if !issafe(report)
        for i in eachindex(report)
            if issafe(report[Not(i)])
                return true
            end
        end
    else
        return true
    end
    return false
end

safe_reports = sum(map(issafe, reports))
safe_reports2 = sum(map(issafe2, reports))

println("Safe reports: $safe_reports")
println("Safe reports 2: $safe_reports2")
