### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 6710a438-60b3-11eb-3f4d-1f20bf10632b
begin
	import Pkg
	Pkg.activate("..")
	using Plots   # pour les graphiques
	using PlutoUI # pour la partie interactive
end

# ╔═╡ b8c02e5c-60ae-11eb-3406-71a8af749eb1
md"""
# Lois Continues
"""

# ╔═╡ e64dfd22-60ae-11eb-0a06-05c3bd1198ff
md"""
Afin de faciliter la recherche et compréhension des concepts, je vais utiliser parfois des abbreviations en anglais. Je veux simplement présenter des différentes loix, enlister leurs paramètres et essayer de les expliquer tout d'abord pour confirmer ma propre compréhension de celles-ci et puis pour faciliter l'apprentissage de ceux qui me suivront.
"""

# ╔═╡ 8e20343c-657f-11eb-07c6-c90cd368c3c2
md"""
* poisson
* bernoulli / geometric ?
* exponential 
* student
* F
* X^2
"""

# ╔═╡ e4886b96-60af-11eb-3446-3781f9e0a830
md"""
## Loi Gaussienne (Normale)

La loi des lois.

\begin{equation}
\mathcal{N}(\mu, \sigma) = f(x) 
= \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{1}{2}(\frac{x - \mu}{\sigma})^2}
\end{equation}
"""

# ╔═╡ 87df4316-624f-11eb-3c51-4719053a20a8
function Normale(x, μ, σ)
	exp(-0.5 * ((x - μ)/σ)^2) / (σ*(2*π)^2)
end

# ╔═╡ dd4d901a-6582-11eb-2060-61d87809df7f
md"""
$(@bind go_normal Button("Reset"))
"""

# ╔═╡ eabbaf28-6250-11eb-086b-5bd8739b310d
let 
	go_normal
	md"""
	μ $(@bind μ Slider(-10:0.1:10, default=0, show_value=true))

	σ $(@bind σ Slider(0.1:0.1:10, default=1, show_value=true))

	lower $(@bind n_lower NumberField(-3:0, default=(μ - 5*σ))) upper $(@bind n_upper 
	NumberField(1:4, default=(μ + 5*σ)))
	"""
end

# ╔═╡ 948f84e0-6583-11eb-0a94-b7cff41c8a8d
x = n_lower:0.1:n_upper;

# ╔═╡ 6c8090ac-6583-11eb-1e5d-5fc9d3bcfe76
plot(x, Normale.(x, μ, σ))

# ╔═╡ Cell order:
# ╟─b8c02e5c-60ae-11eb-3406-71a8af749eb1
# ╟─e64dfd22-60ae-11eb-0a06-05c3bd1198ff
# ╠═8e20343c-657f-11eb-07c6-c90cd368c3c2
# ╠═6710a438-60b3-11eb-3f4d-1f20bf10632b
# ╟─e4886b96-60af-11eb-3446-3781f9e0a830
# ╠═87df4316-624f-11eb-3c51-4719053a20a8
# ╠═6c8090ac-6583-11eb-1e5d-5fc9d3bcfe76
# ╠═948f84e0-6583-11eb-0a94-b7cff41c8a8d
# ╟─dd4d901a-6582-11eb-2060-61d87809df7f
# ╟─eabbaf28-6250-11eb-086b-5bd8739b310d
