using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, 0 <= x1 <= 4)
@variable(model, x2 >= 0)
@objective(model, Max, 3x1 + 5x2)
@constraint(model, 2x2 <= 12)
@constraint(model, 3x1 + 2x2 <=18)

optimize!(model)

println(model)

println("Valor Máximo: ", objective_value(model))
println("Ponto de Máximo: (", value(x1), ", ", value(x2), ')')
