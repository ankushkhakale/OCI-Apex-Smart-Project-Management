-- Seed Data for Event Management Portal

-- Participants
INSERT INTO participants (name, email, phone) VALUES ('John Doe', 'john.doe@example.com', '1234567890');
INSERT INTO participants (name, email, phone) VALUES ('Jane Smith', 'jane.smith@example.com', '0987654321');
INSERT INTO participants (name, email, phone) VALUES ('Alice Brown', 'alice.brown@example.com', '1122334455');

-- Events
INSERT INTO events (title, description, start_date, end_date, location, max_attendees, status)
VALUES ('Oracle APEX Workshop', 'Learn to build low-code apps.', SYSDATE + 2, SYSDATE + 2, 'Virtual', 50, 'UPCOMING');

INSERT INTO events (title, description, start_date, end_date, location, max_attendees, status)
VALUES ('AI in Healthcare', 'Discussing the future of AI.', SYSDATE + 10, SYSDATE + 10, 'Conference Hall A', 100, 'UPCOMING');

-- Registrations
INSERT INTO registrations (event_id, participant_id, status)
SELECT e.event_id, p.participant_id, 'CONFIRMED'
FROM events e, participants p
WHERE e.title = 'Oracle APEX Workshop' AND p.name = 'John Doe';

INSERT INTO registrations (event_id, participant_id, status)
SELECT e.event_id, p.participant_id, 'CONFIRMED'
FROM events e, participants p
WHERE e.title = 'Oracle APEX Workshop' AND p.name = 'Jane Smith';

COMMIT;
