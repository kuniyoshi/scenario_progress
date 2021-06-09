update:
	bin/progress.pl ../scenario_text/scenario.txt >>data/progress

plot:
	R CMD BATCH bin/plot.R
