#Will Kieselstein


library(dplyr)
STATES <- read_csv("us-states.csv")

PENN <- filter(STATES, state=="Pennsylvania")

n_cases <- length(PENN$cases)
n_deaths <- length(PENN$deaths)

PENN$incr_cases <- 1
PENN$incr_deaths <- 1

for (i in 2:n_cases) {
  PENN$incr_cases[i] <- (PENN$cases[i]-PENN$deaths[i-1]) 
}

for (i in 2:n_deaths) {
  PENN$incr_deaths[i] <- (PENN$deaths[i]-PENN$cases[i-1]) 
}

sd_val <- sd(PENN$incr_cases)
sd_val

