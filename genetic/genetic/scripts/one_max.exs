defmodule OneMax do
	@behaviour Problem
	alias Types.Chromosome

	@impl true
	def genotype do
		genes = for _ <- 1..42, do: Enum.random(0..1)
		%Chromosome{genes: genes, size: 42}
	end
	@impl true
	def fitness_function(chromosome), do: Enum.sum(chromosome.genes)
	
	@impl true
	def terminate?(population, generation), do: generation == 100

#def terminate?(population), do: 
#	Enum.max_by(population, &OneMax.fitness_function/1) == 42
#
#def terminate?(population), do: 	
#	Enum.max_by(population, &OneMax.fitness_function/1) == 0

#def terminate?(population) do
#	avg =
#		population
#		|> Enum.map(&(Enum.sum(&1) / length(&1)))
#	avg == 21
#end
end

soln = Genetic.run(OneMax)

IO.write("\n")
IO.inspect(soln)

