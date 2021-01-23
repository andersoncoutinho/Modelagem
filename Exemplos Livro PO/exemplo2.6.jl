using JuMP
import Cbc

modelo = Model(Cbc.Optimizer)

@variable(modelo, 0 <= x1 <= 1500)
@variable(modelo, 0 <= x2 <= 6000)
@objective(modelo, Max, 100x1 + 50x2)
@constraints(modelo,
             begin
                 10x1 + 8x2 <= 25000
                 x1 + x2 <= 4500
             end)

optimize!(modelo)

println(modelo)
println("Valor Máximo: ", objective_value(modelo))
println("Modelo de Luxo: ", value(x1))
println("Modelo Básico: ", value(x2))