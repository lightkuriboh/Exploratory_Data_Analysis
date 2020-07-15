
# Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008?

names(emission_data)

total_emission <- tapply(emission_data$Emissions, emission_data$year, sum)

png(paste(output_folder, 'plot1.png', sep =''))

barplot(total_emission,
        ylab = 'Total emission weight (tons)',
        main = 'Total emissions from PM2.5 in the US from 1999 to 2008')

dev.off()
