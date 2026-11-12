# SunnyCourts Club – Court Booking API
BDF Group Assignment · Group CSE-FSD2B-G07 · Theme 7: Court booking · Twist: Soft delete and restore

Express + SQLite (better-sqlite3) REST API for players, courts and reservations.

## How to run
```bash
npm install
npm start            # server on http://localhost:3000
node seed.js         # (optional) sample players, courts, reservations
./tests.sh           # runs the 3 twist tests (server must be running)
```

## Database (3 related tables)
- `players(id, name, email UNIQUE)`
- `courts(id, name UNIQUE, sport, deleted)`  <- `deleted` is the soft-delete flag
- `reservations(id, player_id -> players, court_id -> courts, date, slot)` with UNIQUE(court_id, date, slot)

## Endpoints
| Method | URL | Success | Notes |
|---|---|---|---|
| GET | /courts | 200 | hides deleted courts; `?sport=tennis` filters |
| GET | /courts/:id | 200 / 404 | deleted court -> 404 |
| POST | /courts | 201 | validated (name >= 3 chars, known sport) |
| PUT | /courts/:id | 200 / 404 | |
| DELETE | /courts/:id | 200 / 404 | soft delete (sets deleted = 1) |
| POST | /courts/:id/restore | 200 / 404 | brings a hidden court back |
| GET/POST/PUT/DELETE | /players, /players/:id | 200 / 201 / 404 | email validated, unique |
| GET/POST/PUT/DELETE | /reservations, /reservations/:id | 200 / 201 / 404 | |
| GET | /reservations/details | 200 | JOIN: player name + court name |

## Status codes
200 OK · 201 Created · 400 validation error · 404 not found · 409 conflict (duplicate / slot already booked)

## Twist tests
1. `DELETE /courts/2` -> 200
2. `GET /courts/2` -> 404
3. `POST /courts/2/restore` -> 200, then `GET /courts/2` -> 200

## Postman
Import `SunnyCourts.postman_collection.json`. Requests are numbered; folder "Twist tests" has the 3 tests with test scripts.
