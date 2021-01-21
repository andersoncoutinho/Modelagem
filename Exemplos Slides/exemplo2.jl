#= ################################################################################################

Para uma boa alimentação, o corpo necessita de vitaminas e proteínas. 
A necessidade mínima de vitaminas é de 32 unidades por dia e a de proteínas de 36 unidades por dia. 
Uma pessoa tem disponível carne e ovos para se alimentar. 
Cada unidade de carne contém 4 unidades de vitaminas e 6 unidades de proteínas.
Cada unidade de ovo contém 8 unidades de vitaminas e 6 unidades de proteínas. 
Qual a quantidade diária de carne e ovos deve ser consumida para suprir 
as necessidades de vitaminas e proteínas com o menor custo possível? 
Cada unidade de carne custa R$3,00 e cada unidade de ovo custa R$2,50.

################################################################################################# =#

using  JuMP
import GLPK

model = Model(GLPK.Optimizer)

@variable(model, carne >= 0)
@variable(model, ovo >= 0)
@objective(model, Min, 3carne + 2.5ovo)
@constraint(model, 4carne + 8ovo >= 32)
@constraint(model, 6carne + 6ovo >= 36)

println(model)

optimize!(model)

precoMinimo = objective_value(model)
qtdCarne = value(carne)
qtdOvo = value(ovo)

println("Valor Mínimo: R\$: ", precoMinimo)
println("Quantidade de carne: ", qtdCarne)
println("Quantidade de ovos: ", qtdOvo)