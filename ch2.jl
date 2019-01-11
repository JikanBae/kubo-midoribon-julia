
using Statistics
using Plots
using Printf

data = [
    2, 2, 4, 6, 4, 5, 2, 3, 1, 2,
    0, 4, 3, 3, 3, 3, 4, 2, 7, 2,
    4, 3, 3, 3, 4, 3, 7, 5, 3, 1,
    7, 6, 4, 6, 5, 2, 4, 7, 2, 2,
    6, 2, 4, 5, 4, 5, 1, 3, 2, 3];
length(data)

# ヒストグラム
histogram(data, bins=-0.5:9.5, xlabel="data", ylabel="Frequency", title="Histogram of data", xticks=0:2:8, yticks=0:2:12, legend=false)

# 標本分散（不偏分散, corrected=falseがデフォルトなので省略してもいい）
var(data, corrected=false)

# 標本標準偏差
std(data)

using Distributions

y = 0:9
prob = pdf.(Poisson(3.56), y)

plot(y, prob, markershape=:auto, linestyle=:dash, legend=false)

histogram(data, bins=-0.5:9.5, xlabel="data", ylabel="Frequency", title="Histogram of data", xticks=0:2:8, yticks=0:2:12, legend=false)
plot!(y, prob*50, markershape=:auto, linestyle=:dash)

y = 0:20
plot(y, pdf.(Poisson(3.5), y), markershape=:auto, linestyle=:dash, xlabel="y", ylabel="prob", label="3.5")
plot!(y, pdf.(Poisson(7.7), y), markershape=:auto, linestyle=:dash, label="7.7")
plot!(y, pdf.(Poisson(15.1), y), markershape=:auto, linestyle=:dash, label="15.1")

# 例
prod(pdf.(Poisson(3.5), data))

y = 0:9
anim = @animate for lambda = [2:0.05:5  ; 4.9:-0.05:2.1]
histogram(data, bins=-0.5:9.5,
        xlabel="data", ylabel="Frequency", title=@sprintf("Histogram of data (lambda=%.2f)", lambda),
        xticks=0:2:8, yticks=0:2:14, ylim=(0,14), legend=false)
    prob = pdf.(Poisson(lambda), y)
    plot!(y, prob*50, markershape=:auto, linestyle=:dash)
end
gif(anim, "fig-2-7.gif")

function logL(m, data)
    sum(log.(pdf.(Poisson(m), data)))
end

lambda = 2:0.1:5
plot(lambda, map(m -> logL(m, data), lambda), ylabel="log-likelihood", legend=false)
