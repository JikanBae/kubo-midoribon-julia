
using CSV
using GLM
using Plots
using StatPlots

d = CSV.read("data3a.csv")

describe(d)

d.x

typeof(d)

typeof(d.x)

typeof(d.f)

# 素のままのPlots.jlを使った場合
scatter(reshape(d.x, (50, 2)), reshape(d.y, (50, 2)), label=["C", "T"])

# StatPlots.jlを使った場合
@df d scatter(:x, :y, group=:f)

@df d boxplot(:f, :y, legend=false)

x = -4:0.1:5
plot(x, exp.(-2 .+ -0.8x), label="{b1, b2} = {-2, -0.8}",
  xlabel="body size x_i", ylabel="lambda_i")
plot!(x, exp.(-1 .+ 0.4x), label="{b1, b2} = {-1, 0.4}")
vline!([0], linestyle=:dash, label="")

fit = glm(@formula(y ~ x), d, Poisson(), LogLink())

fit = glm(@formula(y ~ x + f), d, Poisson(), LogLink())
