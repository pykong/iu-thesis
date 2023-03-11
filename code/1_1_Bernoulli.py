"""
http://www.chadfulton.com/topics/bernoulli_trials_bayesian.html
https://mathworld.wolfram.com/BernoulliDistribution.html
"""
from typing import Final

import matplotlib.pyplot as plt
import seaborn as sns

VOTE_FOR_P = 0.03
VOTE_AGAINST_P = 1 - VOTE_FOR_P
OUTPUT_FILE: Final[str] = "../output/img/1_1_Bernoulli.pdf"

# Configure plot
plt.yticks([i / 10 for i in range(10)])
plt.ylabel("Probability")
plt.xlabel("Observation")

# Create the plot
ax = sns.barplot(data=[[VOTE_AGAINST_P], [VOTE_FOR_P]])

# label bars with probabilities
# https://datavizpyr.com/how-to-annotate-bars-in-barplot-with-matplotlib-in-python/
for p in ax.patches:
    ax.annotate(
        "{number:.{digits}f}".format(number=p.get_height(), digits=2),
        (p.get_x() + p.get_width() / 2.0, p.get_height()),
        ha="center",
        va="center",
        xytext=(0, 5),
        textcoords="offset points",
        fontsize=12,
    )

# Save plot to file
plt.savefig(OUTPUT_FILE)
