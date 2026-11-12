// Optional sample data: node seed.js
const db = require('./src/db');
db.exec(`
  INSERT OR IGNORE INTO players (name, email) VALUES ('Arjun Rao','arjun@mail.com'),('Sneha Reddy','sneha@mail.com');
  INSERT OR IGNORE INTO courts (name, sport) VALUES ('Court 1','tennis'),('Court 2','badminton'),('Court 3','tennis');
  INSERT OR IGNORE INTO reservations (player_id, court_id, date, slot) VALUES (1,1,'2026-11-16','18:00'),(2,2,'2026-11-16','18:00');
`);
console.log('Seeded.');
