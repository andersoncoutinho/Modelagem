using JuMP
import GLPK

model = Model(GLPK.Optimizer)

# Programação Linear
@variable(model, x1 >=0)
@variable(model, x2 >=0)
@objective(model, Max, 2x1 + x2)
@constraint(model, x1 + x2 <= 4)
@constraint(model, 2x1 <= 5)

optimize!(model)

println(model)

println("Valor Máximo: ", objective_value(model))
println("Ponto de Máximo: (", value(x1), ", ", value(x2), ')')

# Programação Linear Inteira
@constraint(model, x1 in MOI.Integer())
@constraint(model, x2 in MOI.Integer())

optimize!(model)

println(model)

println("Valor Máximo: ", objective_value(model))
println("Ponto de Máximo: (", value(x1), ", ", value(x2), ')')