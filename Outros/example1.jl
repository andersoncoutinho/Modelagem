#= ##########################################################################################
A store has requested a manufacturer to produce pants and sports jackets.
For materials, the manufacturer has 750m^2 of cotton textile and 1000m^2 of polyester. 
Every pair of pants (1 unit) needs 1m^2 of cotton and 2m ^2 of polyester. 
Every jacket needs 1.5m^2 of cotton and 1m^2 of polyester. 
The price of the pants is fixed at $50 and the jacket, $40.
What is the number of pants and jackets that the manufacturer must give 
to the stores so that these items obtain a maximum sale?
########################################################################################## =#

using JuMP
import GLPK

model = Model(GLPK.Optimizer)
@variable(model, x1 >= 0)
@variable(model, x2 >= 0)
@objective(model, Max, 50x1 + 40x2)
@constraints(model,
             begin
                 x1 + 1.5x2 <= 750
                 2x1 + 1x2 <= 1000
             end)

optimize!(model)

println(model)
println("Maximum : R\$ ", objective_value(model))
println("Number of Pants: ", value(x1))
println("Number of Sports Jackets: ", value(x2))