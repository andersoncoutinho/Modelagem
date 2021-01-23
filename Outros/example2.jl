#= ###############################################################################
Maria has an online shop where she sells hand made paintings and cards.
She sells the painting for $50 and the card for $20.
It takes her 2 hours to complete 1 painting and 45 minutes to make a single card.
She also has a day job and makes paintings and cards in her free time.
She cannot spend more than 15 hours a week to make paintings and cards.
Additionally, she should make not more than 10 paintings and cards per week.
She makes a profit of $25 on painting and $15 on each card.
How many paintings and cards should she make each week to maximize her profit.
############################################################################### =#

using JuMP
import Cbc

model = Model(Cbc.Optimizer)
@variable(model, x1 >= 0)
@variable(model, x2 >= 0)
@objective(model, Max, 25x1 + 15x2)
@constraint(model, 2x1 + 0.75x2 <= 15)
@constraint(model, x1 + x2 <= 10)

optimize!(model)

println(model)

println("Maximum Profit: \$ ", objective_value(model))
println("Number of Paintings: ", value(x1))
println("Number of Cards: ", value(x2))