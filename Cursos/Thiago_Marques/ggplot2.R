# bibliotecas -----------------------------------------------------------------

library(tidyverse)
library(plotly)

# dados -----------------------------------------------------------------------

mtcars
str(mtcars)
glimpse(mtcars)

# estetica

ggplot(mtcars, aes(x = wt, y = mpg))

# pontos ----------------------------------------------------------------------

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

# separando por grupos

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   col = factor(cyl))) +
  geom_point()

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  facet_grid(~ factor(cyl))

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  facet_wrap(~ factor(cyl), ncol = 2) +
  geom_smooth(method = "lm", se = T)

# separando por mais de um grupos

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   col = factor(am))) +
  geom_point() +
  facet_grid(~ factor(cyl))

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   col = hp)) +
  geom_point() +
  facet_grid(~ factor(cyl))

ggplot(mtcars, aes(x = wt, 
                   y = mpg, 
                   col = hp, 
                   size = factor(carb))) +
  geom_point() +
  facet_grid(~ factor(cyl))

ggplot(mtcars, aes(x = wt,
                   y = mpg, 
                   col = hp, 
                   size = factor(carb), 
                   alpha = .3)) +
  geom_point() +
  facet_grid(~ factor(cyl))

ggplot(mtcars, aes(x = wt, y = mpg, col = hp, 
                   size = factor(carb), 
                   alpha = I(.3))) +
  geom_point() +
  facet_grid(~ factor(cyl))


# barras ----------------------------------------------------------------------

ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar()

ggplot(mtcars, aes(x = factor(cyl), 
                   fill = factor(cyl))) +
  geom_bar()

ggplot(mtcars, aes(x = factor(cyl), 
                   col = factor(cyl),
                   fill = factor(cyl))) +
  geom_bar() +
  xlab("Número de cilindros")


# histogramas -----------------------------------------------------------------

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(bins = 10)

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(bins = 10, aes(y = ..density..))

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(bins = 10, aes(y = ..density..)) +
  geom_density()

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(bins = 10, aes(y = ..density..)) +
  geom_density(aes(alpha = I(.5)))

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(bins = 10, 
                 position = "dodge", 
                 aes(y = ..density..)) +
  geom_density(aes(alpha = I(.5)))


# boxplots --------------------------------------------------------------------

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot()

ggplot(mtcars, aes(x = factor(cyl), y = mpg, 
                   col = factor(cyl))) +
  geom_boxplot()

ggplot(mtcars, aes(x = factor(cyl), y = mpg, 
                   fill = factor(cyl))) +
  geom_boxplot()

ggplot(mtcars, aes(x = factor(cyl), y = mpg, 
                   fill = factor(cyl))) +
  geom_boxplot() +
  geom_jitter()

ggplot(mtcars, aes(x = factor(cyl), y = mpg, 
                   fill = factor(cyl))) +
  geom_boxplot() +
  geom_jitter(aes(alpha = I(.5), col = I("blue")))

ggplot(mtcars, aes(x = factor(cyl), y = mpg, 
                   fill = factor(cyl))) +
  geom_boxplot() +
  geom_jitter(aes(alpha = I(.5), col = I("blue"))) +
  labs(title = "Boxplot das distribuições de Milhas por Galão", 
       subtitle = "Qualquer subtítulo", 
       y = "mpg", 
       x = "", 
       caption = "qualquer texto de interesse")

ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_boxplot() +
  geom_jitter(aes(alpha = I(.5), col = I("blue"))) +
  labs(title = "Boxplot das distribuições de Milhas por Galão", 
       subtitle = "Qualquer subtítulo", 
       y = "mpg", 
       x = "", 
       caption = "qualquer texto de interesse") +
  theme_minimal()

ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_boxplot() +
  geom_jitter(aes(alpha = I(.5), col = I("blue"))) +
  labs(title = "Boxplot das distribuições de Milhas por Galão", 
       subtitle = "Qualquer subtítulo", 
       y = "mpg", 
       x = "", 
       caption = "qualquer texto de interesse") +
  theme_minimal() +
  stat_summary(fun.y = mean, 
               geom = "point", 
               shape = 5, 
               size = 3)

ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_boxplot(outlier.colour = "red") +
  geom_jitter(aes(alpha = I(.5), col = I("blue"))) +
  labs(title = "Boxplot das distribuições de Milhas por Galão", 
       subtitle = "Separados por número de cilindros", 
       y = "mpg", 
       x = "", 
       caption = "outlier em vermelho") +
  theme_minimal() +
  stat_summary(fun.y = mean, geom = "point", shape = 5, size = 3)


# heatmap ---------------------------------------------------------------------

mtcars %>% 
  group_by(cyl, am) %>% 
  summarise(total = n())

mtcars %>% 
  group_by(cyl, am) %>% 
  summarise(total = n()) %>% 
  ggplot(aes(x = factor(am), y = factor(cyl))) +
  geom_tile(aes(fill = total), colour = "white") +
  scale_fill_gradient(low = "turquoise4", 
                      high = "orange") +
  xlab("cambio") +
  ylab("cilindros")

mtcars %>% 
  group_by(cyl, am) %>% 
  summarise(total = n()) %>% 
  ggplot(aes(x = factor(am), y = factor(cyl))) +
  geom_tile(aes(fill = total), colour = "white") +
  scale_fill_gradient(low = "turquoise4", 
                      high = "orange") +
  theme(panel.border = element_blank(), 
        panel.background = element_blank())

mtcars %>% 
  group_by(cyl, am) %>% 
  summarise(total = n()) %>% 
  ggplot(aes(x = factor(am), y = factor(cyl))) +
  geom_tile(aes(fill = total), colour = "white") +
  scale_fill_gradient(low = "turquoise4", high = "orange") +
  theme(panel.border = element_blank(), panel.background = element_blank()) +
  labs(title = "Heatmap", subtitle = "", y = "cyl", x = "am", caption = "")


# densidade univariada --------------------------------------------------------

ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(group = cyl))

ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(group = cyl, col = cyl))

ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(group = cyl, col = factor(cyl)))

ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(group = cyl, col = factor(cyl), 
                   fill = factor(cyl)))

ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(group = cyl, col = factor(cyl), 
                   fill = factor(cyl), alpha = I(.3))) +
  facet_grid(~ vs)

ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(group = cyl, col = factor(cyl), 
                   fill = factor(cyl), alpha = I(.3))) +
  facet_grid(~ vs) +
  theme_minimal()


# densidade bivariada ---------------------------------------------------------

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + 
  geom_density_2d()

ggplot(mtcars, aes(x = wt, y = mpg)) +
  theme(panel.border = element_blank(), 
        panel.background = element_blank(),
        axis.text.x = element_blank(), 
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(), 
        axis.ticks.y = element_blank()) +
  labs(title = "", subtitle = "", y = "", 
       x = "", caption = "") +
  geom_point() + 
  geom_density_2d()


# 3D --------------------------------------------------------------------------

with(mtcars, 
     plot_ly(x = wt, 
             y = hp, 
             z = mpg, 
             type = "scatter3d", 
             alpha = .3, 
             size = 2)
     )


