
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City?

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

Baltimore_City_Maryland <- emission_data %>% dplyr::filter(fips == '24510')

motor_related_in_Baltinore <- subset(Baltimore_City_Maryland,
                                     Baltimore_City_Maryland$SCC %in% motor_related_SCC)

total_emission_motor_related_in_Baltimore <- tapply(motor_related_in_Baltinore$Emissions,
                                                    motor_related_in_Baltinore$year,
                                                    sum)

total_emission_motor_related_in_Baltimore

png(paste(output_folder, 'plot5.png', sep =''))

barplot(total_emission_motor_related_in_Baltimore,
        main = 'PM2.5 emissions from motor vehicle sources changed\nfrom 1999–2008 in Baltimore City',
        ylab = 'Total emission weight (tons)')

dev.off()
