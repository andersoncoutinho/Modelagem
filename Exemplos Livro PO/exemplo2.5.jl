using JuMP
import Cbc

modelo = Model(Cbc.Optimizer)

c = [0 0 1 3 0 0 0;
     0 0 1 2 0 0 0;
     0 0 0 0 1 3 3;
     0 0 0 0 3 4 1]
@variable(modelo, x[i=1:4, j=3:7] >= 0)
@objective(modelo, Min, sum(c[i,j]*x[i,j] for i in 1:4 for j in 3:7))
@constraints(modelo,
             begin
                x[1,3] + x[1,4] <= 800
                x[2,3] + x[2,4] <= 1000
                x[3,5] + x[4,5] == 500
                x[3,6] + x[4,6] == 400
                x[3,7] + x[4,7] == 900
                x[1,3] + x[2,3] == x[3,5] +x[3,6] + x[3,7]
                x[1,4] + x[2,4] == x[4,5] +x[4,6] + x[4,7]
             end)   
optimize!(modelo)

println(modelo)
println("Custo Mínimo: ", objective_value(modelo))
