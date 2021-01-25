using JuMP
import Cbc

modelo = Model(Cbc.Optimizer)
n = 24
A = [1 1 1 1 0 0 0 0 1 0 1 0 1 0 1 0 1 1 0 0 1 1 0 0;
     0 0 0 0 1 1 1 1 0 1 0 1 0 1 0 1 0 0 1 1 0 0 1 1;
     1 1 0 0 1 1 0 0 1 1 1 1 0 0 0 0 1 0 1 0 1 0 1 0;
     0 0 1 1 0 0 1 1 0 0 0 0 1 1 1 1 0 1 0 1 0 1 0 1;
     1 0 1 0 1 0 1 0 1 1 0 0 1 1 0 0 1 1 1 1 0 0 0 0;
     0 1 0 1 0 1 0 1 0 0 1 1 0 0 1 1 0 0 0 0 1 1 1 1;]

c = [20 16 17 18 20 13 14 15 20 21 31 15 11 43 54 45 34 23 34 12 34 11 43 12]

@variable(modelo, x[j=1:n], Bin)
@objective(modelo, Min, sum(c[j]*x[j] for j in 1:n))
for i in 1:6
    @constraint(modelo, (A*x)[i] >= 1)
end
optimize!(modelo)

println(modelo)

println("Solução: ", objective_value(modelo))
for i in 1:n
    if(value(x[i]) == 1)
        print("x[", i, "] = ")
    end
end
println(1)