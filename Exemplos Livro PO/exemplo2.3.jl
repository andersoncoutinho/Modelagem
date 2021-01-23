using JuMP
import Cbc

model = Model(Cbc.Optimizer)
@variable(model, x[i=1:2, j=1:3] >= 0)
@objective(model, Min, 4x[1,1] + 11x[2,1] + 2x[1,2] + 7x[2,2] + 5x[1,3] + 4x[2,3])
@constraint(model, x[1,1] + x[2,1] == 500)
@constraint(model, x[1,2] + x[2,2] == 400)
@constraint(model, x[1,3] + x[2,3] == 900)
@constraint(model, x[1,1] + x[1,2] + x[1,3] <= 800)
@constraint(model, x[2,1] + x[2,2] + x[2,3] <= 1000)

optimize!(model)

println(model)

println("Custo Mínimo: ", objective_value(model))
println("x[1,1]: ", value(x[1,1]))
println("x[2,1]: ", value(x[2,1]))
println("x[1,2]: ", value(x[1,2]))
println("x[2,2]: ", value(x[2,2]))
println("x[1,3]: ", value(x[1,3]))
println("x[2,3]: ", value(x[2,3]))
