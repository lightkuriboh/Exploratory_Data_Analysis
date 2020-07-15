
data_folder <- 'raw_data/'
output_folder <- 'output/'

emission_data_path <- paste(data_folder,
                            'summarySCC_PM25.rds',
                            sep = '')
source_classification_path <- paste(data_folder,
                                    'Source_Classification_Code.rds',
                                    sep = '')

emission_data <- readRDS(emission_data_path)
emission_data$Pollutant <- NULL
source_classification <- readRDS(source_classification_path)

### Explore 

names(emission_data)
with(emission_data, table(year))
dim(emission_data)
str(emission_data)

names(source_classification)
head(source_classification)
unique(source_classification$Data.Category)
str(source_classification)
sum(is.na(source_classification$Map.To))
sum(is.na(source_classification$Last.Inventory.Year))
dim(source_classification)
