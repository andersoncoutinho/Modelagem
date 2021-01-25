using JuMP
import Cbc

modelo = Model(Cbc.Optimizer)

n = 8
b = 100
p = [41 33 14 25 32 32 9 19]
a = [47 40 17 27 34 23 5 44]

@variable(modelo, x[1:n], Bin)
@objective(modelo, Max, sum(x[j] * p[j] for j in 1:8))
@constraint(modelo, sum(a[j]  *x[j] for j in 1:8) <= 100)

optimize!(modelo)

println(modelo)

println("Retorno: ", objective_value(modelo))
for i in 1:8
    if(value(x[i]) == 1)
    println("x[", i, "] = ", value(x[i]))
    end
end