
# Of the four types of sources indicated by the (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions
# from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?

library(ggplot2)

Baltimore_City_Maryland <- emission_data %>% dplyr::filter(fips == '24510')
sum_by_type <- Baltimore_City_Maryland %>%
                group_by(type, year) %>%
                summarise(sum(Emissions))

names(sum_by_type) <- c('type', 'year', 'total_emission')

png(paste(output_folder, 'plot3.png', sep =''))

with(sum_by_type, ggplot2::qplot(x = year, y = total_emission, color = type)) +
    geom_line() +
    ylab('Total emission weight (tons)') +
    ggtitle('PM2.5 Emissions from 1999–2008 for Baltimore Cit by type of source') +
    scale_x_continuous(breaks = seq(1999, 2008, 3), labels = seq(1999, 2008, 3))

dev.off()
