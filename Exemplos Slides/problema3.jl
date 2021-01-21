#= ####################################################################################

O produto “E” dá um lucro de R$ 40,00 por unidade e o “F”, R$ 50,00.
Conforme apresentado na tabela abaixo, para sua fabricação são necessários 3 estágios. 
Durante o ciclo de produção, 
o equipamento de mistura está disponível por no máximo 12 h, 
o de refrigeração por 30 h
e o de empacotamento por 15 h. 
Determine o número de unidades a produzir em cada ciclo de produção.

Produto Mistura Refrigeração Embalagem
    E      1min     5min        3min
    F      2min     4min        1min

#################################################################################### =#

using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, E >= 0)
@variable(model, F >= 0)
@objective(model, Max, 40E + 50F)
@constraint(model, 1E + 2F <= (12*60))
@constraint(model, 5E + 4F <= (30*60))
@constraint(model, 3E + 1F <= (15*60))
@constraint(model, E in MOI.Integer())
@constraint(model, F in MOI.Integer())

optimize!(model)

lucroMaximo = objective_value(model)
qtdE = value(E)
qtdF = value(F)

println(model)

println("Lucro Máximo: R\$ ", lucroMaximo)
println("Quantidade do produto E: ", qtdE)
println("Quantidade do produto F: ", qtdF)




