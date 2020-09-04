class FileUpdater

	def initialize(fileName)
		@fileName = fileName
	end
	
	def updateWith(processor)
    processed_phrases = []
		File.readlines(@fileName).each do |line|
			processed_phrases << processor.process(line.chomp)
    end

    File.open(@fileName, 'w+') do |f|
        processed_phrases.each { |phrase| f.puts phrase }
    end
	end

end
