using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, osso >= 0)
@variable(model, soja >= 0)
@variable(model, peixe >= 0)
@objective(model, Min, 0.56osso + 0.81soja + 0.46peixe)
@constraint(model, 0.2osso + 0.5soja + 0.4peixe >= 0.3)
@constraint(model, 0.6osso + 0.4soja + 0.4peixe >= 0.5)
@constraint(model, osso + soja + peixe == 1)

optimize!(model)

println(model)

println("Custo Mínimo: ", objective_value(model))
println("Quantidade de osso: ", value(osso))
println("Quantidade de soja: ", value(soja))
println("Quantidade de peixe: ", value(peixe))
