# [UNDER CONSTRUCTION]
# Visualizing the danger of multiple t-test comparisons
## Background
Many research questions involve comparing experimental groups to one another. The Dutch have an international reputation for their height, but is the average person from the Netherlands actually taller than people from, say, France or Sweden? 

One way to find out is to measure every person in each of these three countries. (We'd have to measure quickly to account for birth and death rates!) With all 17.2 million, 66.9 million, and 9.9 million people carefully catalogued in our Excel file, we can take the mean of each group (representing the average height) and finally rest knowing whether the Dutch are, indeed, the tallest Europeans.

One issue: censusing this many people is an insane amount of work. Thanks to statistics, we can reach the same conclusion much faster with less effort. At its core, statistics is about making inferences about a **population** from a **sample**. We don't need to measure every single Swede - we can measure a subset (our *sample*), and provided we're sampling randomly and independently, our sample will quickly become an accurate representation of all of Sweden (our *population*). 

Alright, so we go out and sample 50 random people from each country. We can plot our data and see that the distributions of heights look different, and the means indeed are a bit different... but are these differences meaningful? Unlike with our census of the entire population of each country, because we're dealing with a *subset*, we have to take into account *randomness* in our sampling. Just how representative is our sample of the population? *How much* of a difference do we need to see before we can say "the Dutch are definitely the tallest Europeans"?

A commonly-used method for comparing two groups is the **[t-test](https://en.wikipedia.org/wiki/Student%27s_t-test)**. t-tests are a simple, powerful tool (assuming the required assumptions are met in the data), and they're a staple of inroductory statistics courses. 

In short, a t-test quantifies the probability that two samples are drawn from the same parent normal distribution or whether their parent distributions have different means.


When we compare more than two groups, however, we need to perform an [analysis of variance](https://en.wikipedia.org/wiki/Analysis_of_variance). 

When faced with multiple comparisons, it can be tempting to perform 



![](https://i.imgur.com/9lFNSD5.png)





