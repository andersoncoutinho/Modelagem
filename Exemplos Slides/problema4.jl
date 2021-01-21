#= #########################################################################################################

Suponha que para construir uma casa popular por mês uma construtora necessite de 2 pedreiros e 4 serventes.
Para construir um apartamento no mesmo intervalo de tempo, são necessários 3 pedreiros e 8 serventes.
A construtora possui um efetivo total de 30 pedreiros e 70 serventes contratados.
A construtora obtêm um lucro de R$3.000,00 na venda de cada casa popular 
e de R$5.000,00 na venda de cada apartamento
e toda “produção” da construtora é vendida.
Formule um modelo para determinar qual é a quantidade ótima de
casas populares e apartamentos que a construtora deve construir para que esta obtenha lucro máximo.

######################################################################################################### =#

using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, casas >= 0)
@variable(model, apartamentos >= 0)
@objective(model, Max, 3000casas + 5000apartamentos)
@constraint(model, casas in MOI.Integer())
@constraint(model, apartamentos in MOI.Integer())
@constraint(model, 2casas + 3apartamentos <= 30)
@constraint(model, 4casas + 8apartamentos <= 70)

optimize!(model)

lucroMaximo = objective_value(model)
qtdCasas = value(casas)
qtdApartamentos = value(apartamentos)

println(model)

println("Lucro Máximo: R\$ ", lucroMaximo)
println("Quantidade de Casas Populares: ", qtdCasas)
println("Quantidade de Apartamentos: ", qtdApartamentos)

