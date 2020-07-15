
# Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

keys <- c('motor', 'vehicle', 'car', 'fuel', 'gasoline')

motor_related_bool <- vector(mode = 'logical', length = nrow(source_classification))

for (key in keys) {
    for (name in names(source_classification)) {
        motor_related_bool <- motor_related_bool | grepl(key,
                                                         source_classification[[name]],
                                                         ignore.case = T)
    }
}

motor_related_SCC <- source_classification$SCC[motor_related_bool]
#########################################################################
Baltimore_City_Maryland <- emission_data %>% dplyr::filter(fips == '24510')

motor_related_in_Baltinore <- subset(Baltimore_City_Maryland,
                                     Baltimore_City_Maryland$SCC %in% motor_related_SCC)

total_emission_motor_related_in_Baltimore <- tapply(motor_related_in_Baltinore$Emissions,
                                                    motor_related_in_Baltinore$year,
                                                    sum)


#########################################################################
LosAngeles <- emission_data %>% dplyr::filter(fips == '06037')

motor_related_in_LosAngeles <- subset(LosAngeles,
                                      LosAngeles$SCC %in% motor_related_SCC)

total_emission_motor_related_in_LosAngeles <- tapply(motor_related_in_LosAngeles$Emissions,
                                                    motor_related_in_LosAngeles$year,
                                                    sum)
#########################################################################

two_city_emission_data <- rbind(total_emission_motor_related_in_Baltimore, total_emission_motor_related_in_LosAngeles)

png(paste(output_folder, 'plot6.png', sep =''))

barplot(two_city_emission_data,
        col = c('red', 'green'),
        main = 'PM2.5 emission of Baltimore and Los Angeles from 1999 to 2008',
        ylab = 'Total emission weight (tons)',
        legend = rownames(two_city_emission_data))

dev.off()
