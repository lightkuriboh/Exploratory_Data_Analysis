
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008?

library(dplyr)

Baltimore_City_Maryland <- emission_data %>% dplyr::filter(fips == '24510')

total_emission <- tapply(Baltimore_City_Maryland$Emissions,
                         Baltimore_City_Maryland$year,
                         sum)

png(paste(output_folder, 'plot2.png', sep =''))

barplot(total_emission,
        ylab = 'Total emission weight (tons)',
        main = 'Total emissions from PM2.5 in the Baltimore City, Maryland\nfrom 1999 to 2008')

dev.off()
