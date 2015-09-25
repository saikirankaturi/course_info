# desc "Imports a CSV file into an ActiveRecord table"
# task :csv_model_import, [:filename, :model] => :environment do |task,args|
#   # lines = File.new(args[:filename]).readlines
#   # header = lines.shift.strip
#   # keys = header.split('\t')
#   # lines.each do |line|
#   #   values = line.strip.split('\t')
#   #   attributes = Hash[keys.zip values]
#   #   Module.const_get(args[:model]).create(attributes)
#   # end
# end
#lib/tasks/import.rake
	# SmarterCSV.process('courses_final.csv', {:col_sep=>"\t",:row_sep=>"\n",:key_mapping => {:selfstudy=> nil,:modtime=> nil,:prereq=>nil}}) do |chunk|
	# 	chunk.each do |data_hash|
	# 	   Article.create!(data_hash)
	# 	end
	# end
require 'csv'
require 'smarter_csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
	# CSV.foreach('courses_final.csv', :headers => true) do |row|
	# 	Article.create!(row.to_hash)
	# end
	SmarterCSV.process('courses_final.csv', {:col_sep=>"\t",:row_sep=>"\n",:key_mapping => {:modtime=> nil}}) do |chunk|
		chunk.each do |data_hash|
		   Article.create!(data_hash)
		end
	end
end
