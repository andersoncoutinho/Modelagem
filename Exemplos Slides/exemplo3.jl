using JuMP
import GLPK

model = Model(GLPK.Optimizer)
@variable(model, x1 >= 0)
@variable(model, x2 >= 0)
@objective(model, Max, 40x1 + 50x2)
@constraint(model, x1 + 2x2 <= 12)
@constraint(model, 5x1 + 4x2 <= 30)
@constraint(model, 3x1 + x2 <= 15)

optimize!(model)

println(model)
println("Ótimo: ", objective_value(model))
println("x1: ", value(x1))
println("x2: ", value(x2))