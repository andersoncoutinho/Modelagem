using JuMP
import GLPK

modelo = Model(GLPK.Optimizer)

d = [100 90 120;
      40 50 80]
c = [20 20 30;
     20 20 30]
l = [2 3;
     2.5 3.5]

@variable(modelo, x[i=1:2, j=1:3] >= 0)
@variable(modelo, I[i=1:2, j=1:2] >= 0)
@objective(modelo, Min, sum(c[i,j]*x[i,j] for i in 1:2 for j in 1:3)
                       +sum(l[i,j]*I[i,j] for i in 1:2 for j in 1:2))
@constraints(modelo,
                begin
                    x[1,1] - I[1,1] == 100
                    x[1,2] + I[1,1] - I[1,2] == 90
                    x[1,3] + I[1,2] == 120
                    x[2,1] - I[2,1] == 40
                    x[2,2] + I[2,1] - I[2,2] == 70 
                    x[2,3] + I[2,2] == 80
                    (1.0/4.0)x[1,1] + (1.0/3.0)x[2,1] <= 40
                    (1.0/4.0)x[1,2] + (1.0/3.0)x[2,2] <= 40
                    (1.0/4.0)x[1,3] + (1.0/3.0)x[2,3] <= 40
                end)

optimize!(modelo)

println(modelo)

println("Custo Mínimo: \$ ", objective_value(modelo))
println("x[1,1] = ", value(x[1,1]))
println("x[2,1] = ", value(x[1,1]))
println("x[1,2] = ", value(x[1,2]))
println("x[2,2] = ", value(x[1,2]))
println("x[1,3] = ", value(x[1,3]))
println("x[2,3] = ", value(x[1,3]))