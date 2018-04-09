# [UNDER CONSTRUCTION]
# Visualizing the danger of multiple t-test comparisons
## 1. Background
### 1a. Motivation
Many research questions involve comparing experimental groups to one another. The Dutch have an international reputation for their height, but is the average person from the Netherlands actually taller than people from, say, France or Sweden? 

One way to find out is to measure every person in each of these three countries. (We'd have to measure quickly to account for birth and death rates!) With all 17.2 million, 66.9 million, and 9.9 million people carefully catalogued in our Excel file, we can take the mean of each group (representing the average height) and finally rest knowing whether the Dutch are, indeed, the tallest Europeans.

<img align="right" src="https://i.imgur.com/JbXsczj.png"> One issue: censusing this many people is an insane amount of work. Thanks to statistics, we can reach the same conclusion much faster with less effort. At its core, statistics is about making inferences about a **population** from a **sample**. We don't need to measure every single Swede - we can measure a subset (our *sample*), and provided we're sampling randomly and independently, our sample will quickly become an accurate representation of all of Sweden (our *population*). 

Alright, so we go out and sample 50 random people from each country. We can plot our data and see that the distributions of heights look different, and the sample means indeed are a bit different... but are these differences meaningful? Unlike with our census of the entire population of each country, because we're dealing with a *subset*, we have to take into account *randomness* in our sampling. Just how representative is our sample of the population? *How much* of a difference do we need to see before we can say "the Dutch are definitely the tallest Europeans"?

### 1b. t-tests and ANOVAs
A commonly-used method for comparing two groups is the **[t-test](https://en.wikipedia.org/wiki/Student%27s_t-test)**. t-tests are a simple, powerful tool (assuming the required assumptions are met in the data), and they're a staple of introductory statistics courses. In short, a t-test quantifies the probability that *the populations* two samples are drawn from have the same mean. The sample means might differ, but a t-test translates that difference into an inference on the populations.

A t-test returns a [p-value](https://en.wikipedia.org/wiki/P-value): the probability, given the two population means are identical, that you'd get your difference in sample means (or greater). Because our samples are *representations* of our populations, we'll expect some meaningless differences between samples just due to chance. If you select another 50 people from the Netherlands to measure, you'll most likely have a different mean from your first sample. 

*(The true definition is a little more complicated because this is frequentist statistics: assuming the two populations have identical means, if you ran your experiment thousands of times, it's the proportion of samples that would have at least as large a difference in sample means.)*



When we compare more than two groups, however, we need to perform an [analysis of variance](https://en.wikipedia.org/wiki/Analysis_of_variance). For our heights example, it can be tempting to run three t-tests: comparing the Dutch heights to French heights, Dutch heights to Swedish heights, and French heights to Swedish heights. This, however, is dangerous: **multiple t-tests inflate the probability of (falsely) declaring that the two population means are different, when they actually aren't.** 

When faced with multiple comparisons, it can be tempting to perform 



![](https://i.imgur.com/9lFNSD5.png)





