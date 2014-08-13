all: retrieve-latest-source uncompress-source create-cleaned-dir action cuisine violation webextract cleanup-source
	@echo "all done. now go make something!!!"
	@echo

retrieve-latest-source: create-source-dir
	@echo "retrieving latest source of restaurant inspection data"
	@curl -o source/inspection-data.zip -L https://data.cityofnewyork.us/download/4vkw-7nck/ZIP
	@echo

uncompress-source:
	@echo "unzipping inspection-data.zip"
	@unzip source/inspection-data.zip -d source
	@echo

create-source-dir:
	@mkdir -p source
	@echo "created source folder"
	@echo

create-cleaned-dir:
	@mkdir -p cleaned
	@echo "created cleaned directory"
	@echo

action:
	@cp -f ./source/Action.txt ./cleaned/Action.csv
	@echo "copying Action.txt -> cleaned/Action.csv"
	@echo

cuisine:
	@cp -f ./source/Cuisine.txt ./cleaned/Cuisine.csv
	@echo "copying Cuisine.txt -> cleaned/Cuisine.csv"
	@echo

violation:
	@ruby lib/violation_cleanup.rb
	@echo "cleaning Violation.txt file"
	@echo "copying Violation.txt -> cleaned/Violation.csv"
	@echo

webextract:
	@ruby lib/web_extract_cleanup.rb
	@echo "cleaning WebExtract.txt file"
	@echo "copying WebExtract.txt -> csv/WebExtract.csv"
	@echo

cleanup-source:
	@echo "removing source directory..."
	@rm -rf source

