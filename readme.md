# Event Calendar - Introduction

This will be a short project whose aim is to display a full-page
calendar that contains events for different users.  

## Calendar

We simply want to display a full-page calendar that acts as a sort-of
"respository" for all the events that occur during the displayed time
period.  It is easiest to display the calendar according to month, so
for a given month the calendar will list all the events that occur on a
particular day during that month.

We will be using a third-party gem, `watu-table-builder`, which we will
address in Phase 1.

## Events and Users

We can associate
many events with a user, and many users can participate in a single
event.  Thus, we will have a many-many relationship between events and
users.

We will implement this relationship by using the Rails
`has_and_belongs_to_many` association in both the event model and the
user model.
