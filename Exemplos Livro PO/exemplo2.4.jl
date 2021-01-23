using JuMP
import Cbc

modelo = Model(Cbc.Optimizer)
c = [30 13 21; 12 40 26; 27 15 35; 37 25 19]
@variable(modelo, x[i=1:4, j=1:3] >= 0)
@objective(modelo, Min, sum(c[i,j]*x[i,j] for i in 1:4 for j in 1:3))
@constraints(modelo,
            begin
            sum(x[i,j] for i in 1:4 for j in 1:1) == 697
            sum(x[i,j] for i in 1:4 for j in 2:2) == 421
            sum(x[i,j] for i in 1:4 for j in 3:3) == 612
            sum(x[i,j] for i in 1:1 for j in 1:3) <= 433
            sum(x[i,j] for i in 2:2 for j in 1:3) <= 215
            sum(x[i,j] for i in 3:3 for j in 1:3) <= 782
            sum(x[i,j] for i in 4:4 for j in 1:3) <= 300
            end)
            
optimize!(modelo)
println(modelo)
println("Custo Mínimo: ", objective_value(modelo))