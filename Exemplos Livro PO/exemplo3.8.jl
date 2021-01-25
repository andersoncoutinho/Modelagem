using JuMP
import GLPK

modelo = Model(GLPK.Optimizer)

m = 3
n = 8
c = [15 61  3 94 86 68 69 51;
     21 28 76 48 54 85 39 72;
     21 21 46 43 21  3 84 44]

a = [31 69 14 87 51 65 35 54;
     23 20 71 86 91 57 30 74;
     20 55 39 60 83 67 35 32]
b = [100 100 100]
@variable(modelo, x[i=1:3, j=1:8], Bin)
@objective(modelo, Min, sum(c[i,j]*x[i,j] for i in 1:m for j in 1:n))
for j in 1:n
    @constraint(modelo, sum(x[i,j] for i in 1:m) == 1)
end

for i in 1:m
    @constraint(modelo, sum(a[i,j]*x[i,j] for j in 1:n) <= b[i])
end

optimize!(modelo)

println(modelo)
println(objective_value(modelo))
for i in 1:m
    for j in 1:n
        if(value(x[i,j]) == 1)
            println("x[", i, ',', j, "] = ", value(x[i,j]))
        end
    end
end