library(ggplot2)
library(ggsci)

ggplot(
    data = iris,
    mapping = aes(
        x = iris$Sepal.Length,
        y = iris$Sepal.Width,
        color = Species
    )
) + geom_point() + scale_color_nejm() + labs(x="Sepal.Length", y="Sepal.Width", colour="species")

ggsave("plot.png")
