# Event Calendar - Phase 2

In this final phase we have two goals:

1. Create the association between events and users
2. Display links to events in the calendar

## Event-User Association

We want to create a `has_and_belongs_to_many` association between events
and users.  Remember there are three steps to do so:

1. add the `has_and_belongs_to_many` method to each model
2. create the events_users migration
3. edit the migration to provide for the correct columns in the
`events_users` table

After setting up the association, you can seed the database with events
and users, and create random associations for later display.  Remember
to create events with at least a start time, or else the calendar form
helper will generate an error when it tries to match up a nil date with
the current day...

Finally, make to edit the event show page so that it displays all users
associated with an event.

## Display Events In Calendar

This is a bit more complicated.  First, we have to grab all events in
the index action in the HomePageController:

```
def index
  @events = Event.all
end
```

Next in the index view, we have to pass that instance variable to the
calendar methods provided by the watu_table_builder gem.  We use that
variable to iterate through each calendar day, and if that day contains
an event, print out its name along with a corresponding link to that
event.  Remember the catch for the calendar.day
method: we have to tell it which field in the event to use for
comparison.  By default, it looks for an Event.date method, which we do
not have.  We have an Event.start_time method, and we have to pass that
to the calendar.day method:

```
<div id="calendar">
<%= calendar_for(@events) do |calendar| %>
  <%= calendar.head('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun') %>
  <%= calendar.day(:day_method => :start_time) do |day, events| %>
    <%= day.day %>
    <% events.each do |event| %>
      <%= link_to event.name, event %>
    <% end %>
  <% end %>
<% end %>
</div>
```

Fire up the test server, or create a few unit test, and verify that your
new Event Calendar is functioning properly!
