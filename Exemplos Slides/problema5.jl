#= ###########################################################################################

Os alunos do curso de Engenharia devem cursar pelo menos 21 créditos de disciplinas optativas. 
Formule um modelo para determinar que disciplinas o aluno deverá optar por cursar para
“pagar” o menor número de cadeiras possíveis.

Disciplina          Nº créditos
Língua Portuguesa       5
Língua Inglesa          5
SIG                     3
Plan. e Anál. de Exp.   4
Simulação               4
Adm Estratégica         2
Gestão de Materiais     2
Top. Esp. em EP         2
Contab. Gerencial       4

######################################################################### =#

using JuMP
import Cbc
cadeiras = ["Língua Portuguesa", "Língua Inglesa", "SIG", "Plan. e Anál. de Exp.", "Simulação", "Adm Estratégica",
            "gestão de Materiais", "Top. Esp. em EP", "Contab. Gerencial"]
model = Model(Cbc.Optimizer)

@variable(model, x[1:9], Bin)
@objective(model, Min, sum(x[1:9]))
@constraint(model, 5x[1] + 5x[2] + 3x[3] +4x[4] + 4x[5] + 2x[6] + 2x[7] + 2x[8] + 4x[9] >= 21)


optimize!(model)

println(model)

println("Número de Cadeiras: ", objective_value(model), '\n')

for i in (1,2,3,4,5,6,7,8,9)
    if(value(x[i]) == 1)
        println(cadeiras[i])
    end
end


