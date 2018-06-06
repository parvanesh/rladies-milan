# data source www.r-bloggers.com

# We purchased a new training course and we want to see if it works!

# We record the score of each student before using the course
before = c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3)
# We also record their performance after using the course
after = c(12.7, 13.6, 12.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0, 11.1)

# Since our two samples are dependent (the are the same people with 
# different situations, not two diffent group of people)

# Notice the paired = TRUE argument we put in the function
# At this point we are just Intrested to see if the course has any impact at all
# so we don't care if the impact is positive or negative
t.test(before, after, paired=TRUE)



# Now imagine we have another course and this time we also want to see if 
# there is any POSITIVE" impact

# the before set is equal:
before = c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3)
# This "after" is differnet from the previous "after" !
after = c(12.0, 12.2, 11.2, 13.0, 15.0, 15.8, 12.2, 13.4, 12.9, 11.0)

# Notice the alt = 'greater' argument
t.test (before, after, paired = TRUE, alt = "greater")

# finish
