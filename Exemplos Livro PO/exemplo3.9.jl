using JuMP
import Cbc

modelo = Model(Cbc.Optimizer)

n = 6
c = [20 76 16 23 23 18]
A = [1 1 0 0 1 0;
     1 0 1 0 0 0;
     0 1 0 1 0 0;
     0 0 1 0 0 1;
     0 1 1 0 0 1]

@variable(modelo, x[i=1:6], Bin)
@objective(modelo, Min, sum(c[i]*x[i] for i in 1:n))
for i in 1:5
    @constraint(modelo, (A * x)[i]  >= 1)
end
optimize!(modelo)

println(modelo)

println("Solução Ótima: ", objective_value(modelo))

for i in 1:6
    if(value(x[i]) == 1)
        print("x[", i, "] = ")
    end
end
println(1)