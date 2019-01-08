class EventList {
  Map<DateTime, List<DateTime>> events;

  EventList({
    this.events,
  });

  void add(DateTime date, DateTime event) {
    if (events == null)
      events = {
        date: [event]
      };
    else if (!events.containsKey(date))
      events[date] = [event];
    else
      events[date].add(event);
  }

  void addAll(DateTime date, List<DateTime> events) {
    if (this.events == null)
      this.events = {date: events};
    else if (!this.events.containsKey(date))
      this.events[date] = events;
    else
      this.events[date].addAll(events);
  }

  bool remove(DateTime date, DateTime event) {
    return events != null && events.containsKey(date)
        ? events[date].remove(event)
        : true;
  }

  List<DateTime> removeAll(DateTime date) {
    return events != null && events.containsKey(date)
        ? events.remove(date)
        : [];
  }

  void clear() {
    if (events != null) {
      events.clear();
    } else {
      events = {};
    }
  }

  List<DateTime> getEvents(DateTime date) {
    return events != null && events.containsKey(date) ? events[date] : [];
  }
}
