#= ###################################################################################################

Certa empresa fabrica dois produtos: P1 e P2. 
O lucro unitário do produto P1 é de R$1.000 e o lucro unitário de P2 é de R$1.800. 
A empresa precisa de 20h para fabricar uma unidade de P1 e de 30h para fabricar uma unidade de P2. 
O tempo anual de produção disponível para isso é de 1.200h. 
A demanda esperada para cada produto é de 40 unidades anuais para P1 e 30 unidades anuais para P2.
Qual é o plano de produção para que a empresa maximize seu lucro nesses ítens?

#################################################################################################### =#

using JuMP
import GLPK

model = Model(GLPK.Optimizer)

@variable(model, 0 <= x1 <= 40)
@variable(model, 0 <= x2 <= 30)
@objective(model, Max, 1000x1 +1800x2)
@constraint(model, 20x1 + 30x2 <= 1200)

println(model)

optimize!(model)

obj_value = objective_value(model)
x1_value = value(x1)
x2_value = value(x2)

println("Lucro Máximo: R\$ ", obj_value)
println("x1: ", x1_value)
println("x2: ", x2_value)