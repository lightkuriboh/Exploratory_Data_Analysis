# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?

coal <- c('coal', 'Coal', 'COAL')

SCC_coal_related <- source_classification$SCC[grepl(paste(coal, collapse = '|'), source_classification$Short.Name)]

data_coal_related <- subset(emission_data, emission_data$SCC %in% SCC_coal_related)

total_emission_by_source <- tapply(data_coal_related$Emissions,
                                   data_coal_related$year,
                                   sum)

png(paste(output_folder, 'plot4.png', sep =''))

barplot(total_emission_by_source,
        main = 'PM2.5 rmissions from coal combustion-related sources\nfrom 1999–2008', 
        ylab = 'Total emission weight (tons)',
        axes = F)
axis(side = 2, at = seq(0, 600000, 200000), labels = seq(0, 600000, 200000))

dev.off()

