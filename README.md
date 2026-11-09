# Pandemic Legacy: Research Station Planner

A helper for the board game *Pandemic Legacy*: given the cities where you already have research stations, it finds the **best city for the next one**, meaning the city farthest from every existing station.

## How it works

- The world map is a graph of cities and their connections (the full board is in `tests.rb`)
- A **multi-source breadth-first search** starts from all current stations at once, labeling every city with its distance to the nearest station
- The cities with the maximum distance are the best candidates

## Tests

The algorithm is covered by **RSpec** specs (single node, two nodes, and larger maps):

```bash
gem install rspec
rspec
```
