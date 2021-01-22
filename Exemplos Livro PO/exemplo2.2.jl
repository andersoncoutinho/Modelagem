# problema sem solução
using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, granito >= 0)
@variable(model, seixo >= 0)
@variable(model, pedraBritada>= 0)
@objective(model, Min, 6granito + 7seixo + 18pedraBritada)
@constraint(model, granito + seixo + pedraBritada == 1)
@constraint(model, 0.05seixo + 0.2pedraBritada >= 0.1)
@constraint(model, 0.1granito + 0.35seixo + 0.78pedraBritada >= 0.2)
@constraint(model, 0.2granito + 0.6seixo + 0.02pedraBritada >= 0.35)
@constraint(model, 0.7granito >= 0.35)

optimize!(model)

println(model)
println("Custo Mínimo: ", objective_value(model))
println("Fração de britas graníticas: ", value(granito))
println("Fração de seixo rolado: ", value(seixo))
println("Fração de pedra britada comercial: ", value(pedraBritada))