
using CSV
using DataFrames
using GLM
using Plots
using StatPlots
using Distributions

d = CSV.read("data3a.csv")

DataFrames.describe(d)   # Rのsummaryっぽいやつ

d.x

typeof(d)

typeof(d.x)

typeof(d.f)

# 素のままのPlots.jlを使った場合
scatter(reshape(d.x, (50, 2)), reshape(d.y, (50, 2)), label=["C", "T"])

# StatPlots.jlを使った場合
@df d scatter(:x, :y, group=:f)

@df d boxplot(:f, :y, legend=false)

x = range(-4, stop=5, length=1001);
plot(x, exp.(-2 .+ -0.8x), label="{b1, b2} = {-2, -0.8}",
  xlabel="body size x_i", ylabel="lambda_i")
plot!(x, exp.(-1 .+ 0.4x), label="{b1, b2} = {-1, 0.4}")
vline!([0], color=:grey, linestyle=:dash, label="")

fit1 = glm(@formula(y ~ x), d, Poisson(), LogLink())

# 推定値
fit1.model.pp.beta0

# Figure 3.6
th = range(-0.2, stop=1.6, length=1001);
plot(th, pdf.(Normal(1.29172, 0.363686), th), label="beta1")
plot!(th, pdf.(Normal(0.0756619, 0.0356042), th), label="beta2")
plot!(th[th .<= 0], pdf.(Normal(0.0756619, 0.0356042), th[th .<= 0]), linealpha=0, fill=(0, 0.5, :orange), label="")
vline!([0], color=:grey, linestyle=:dash, label="")

# 最大対数尤度（maximum log likelihood）
loglikelihood(fit1)

fit2 = glm(@formula(y ~ x + f), d, Poisson(), LogLink())
