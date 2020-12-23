defmodule Speller do
	@behaviour Problem
	alias Types.Chromosome
	
	def genotype do
	# chromosome consist of 34 characters
		genes = 
			Stream.repeatedly(fn -> Enum.random(?a..?z) end)
			|> Enum.take(34)
		%Chromosome{genes: genes, size: 34}
	end

	def fitness_function(chromosome) do
	# counts the number of correct letters in the correct location
		target = "supercalifragilisticexpialidocious"
		guess = List.to_string(chromosome.genes)
		String.jaro_distance(target, guess)
	end
	
	def terminate?(population) do
	# population contains the string supercalifragilisticexpialidocious
		hd(population).fitness == 1
	end
end

soln = Genetic.run(Speller)

IO.write("\n\t Genetic Speller\n")
IO.inspect(soln)
