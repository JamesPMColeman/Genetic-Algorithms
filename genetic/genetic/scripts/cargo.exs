defmodule Cargo do
	@behaviour Problem
	alias Types.Chromosome
	
	@impl true
	def genotype do
		# a chromosome in the cargo problem is a binary array where 1 represents 'take
		# cargo of that corresponding index' and 0 means 'leave cargo to the index'
		
		genes = for _ <- 1..10, do: Enum.random(0..1)
		%Chromosome{genes: genes, size: 10}
	end

	@impl true
	def fitness_function(chromosome) do
		# fitness is profit multiplied by gene summed

		profits = [6, 5, 8, 9, 6, 7, 3, 1, 2, 6]
		profits
			|> Enum.zip(chromosome.genes)
			|> Enum.map(fn {p, g} -> p * g end)
			|> Enum.sum()
	end

	@impl true
	def terminate?(population) do
		Enum.max_by(population, &Cargo.fitness_function/1).fitness == 53
	end
end

soln = Genetic.run(Cargo, population_size: 50)

IO.write("\n\tCargo Optimization\n")
IO.inspect(soln)

weight = 
	soln.genes
	|> Enum.zip([10, 6, 8, 7, 10, 9, 7, 11, 6, 8])
	|> Enum.map(fn {g, w} -> g * w end)
	|> Enum.sum()

IO.write("\nWeight is: #{weight}\n")

