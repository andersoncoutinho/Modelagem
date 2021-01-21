#= ###################################################################################

Um fabricante deseja maximizar a receita bruta.
A tabela abaixo ilustra as composições das ligas, seus preços e as limitações na disponibilidade de MP.

Itens/      Liga    Liga    Matéria-prima
Atividades  tipo A  tipo B   Disponível
Cobre        2       1           16
Zinco        1       2           11
Chumbo       1       3           15

Preço
unitário    R$30    R$50
de vendas

################################################################################## =#

using JuMP
import Cbc

model = Model(Cbc.Optimizer)

@variable(model, ligaTipoA >= 0)
@variable(model, ligaTipoB >= 0)
@objective(model, Max, 30ligaTipoA + 50ligaTipoB)
@constraint(model, 2ligaTipoA + 1ligaTipoB <= 16)
@constraint(model, 1ligaTipoA + 2ligaTipoB <= 11)
@constraint(model, 1ligaTipoA + 3ligaTipoB <= 15)

optimize!(model)

lucroMaximo = objective_value(model)
qtdLigaA = value(ligaTipoA)
qtdLigaB = value(ligaTipoB)

println(model)
println("Lucro Máximo: R\$ ", lucroMaximo)
println("Quantidade da Liga A: ", qtdLigaA)
println("Quantidade da Liga B: ", qtdLigaB)
