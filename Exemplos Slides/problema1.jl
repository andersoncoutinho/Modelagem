#= ###################################################################################

Um vendedor de frutas pode transportar 800 caixas de frutas para sua região de vendas. 
Ele necessita transportar 200 caixas de laranjas a 20 u.m. de lucro por caixa, 
pelo menos 100 caixas de pêssegos a 10 u.m. de lucro por caixa, 
e no máximo 200 caixas de tangerinas a 30 u.m. de lucro por caixa. 
De que forma deverá ele carregar o caminhão para obter lucro máximo?

################################################################################### =#

using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, laranjas >= 200)
@variable(model, pessegos >= 100)
@variable(model, 0 <= tangerinas <= 200)
@objective(model, Max, 20laranjas + 10pessegos + 30tangerinas)
@constraint(model, laranjas + pessegos + tangerinas <= 800)
@constraint(model, laranjas in MOI.Integer())
@constraint(model, pessegos in MOI.Integer())
@constraint(model, tangerinas in MOI.Integer())

optimize!(model)

lucroMaximo = objective_value(model)
qtdLaranjas = value(laranjas)
qtdPessegos = value(pessegos)
qtdTangerinas = value(tangerinas)

println(model)

println("Lucro Máximo: R\$: ", lucroMaximo)
println("Quantidade de caixas de laranja: ", qtdLaranjas)
println("Quantidade de caixas de pêssegos: ", qtdPessegos)
println("Quantidade de caixas de tangerinas: ", qtdTangerinas)


