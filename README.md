# 🎉 Event Management Portal (Oracle APEX)

A web-based portal built with Oracle APEX to manage student/community events.  
Features include participant registration, schedule management, certificate generation, and REST API-based notifications.

## 🚀 Features
- Register participants with unique IDs
- Manage event schedules with calendar view
- Generate dynamic PDF certificates
- Send email/SMS notifications via REST APIs
- Analytics dashboard for attendance & feedback

## 🛠️ Tech Stack
- Oracle APEX
- PL/SQL
- RESTful Web Services (Twilio/SendGrid)
- SQL Workshop for schema setup

## 📂 Repo Structure
- `sql/` → Database schema, seed data, and PL/SQL packages
- `docs/` → Setup instructions and documentation
- `apex_app/` → (Optional) Exported APEX app files
- `api/` → (Optional) REST API definitions

## ⚡ Setup Instructions
**Check out [docs/SETUP_INSTRUCTIONS.md](docs/SETUP_INSTRUCTIONS.md) for a detailed step-by-step guide.**

Quick Summary:
1.  Run `sql/schema.sql` in APEX SQL Workshop.
2.  Run `sql/pkg_event_manager.sql` to install backend logic.
3.  Run `sql/seed_data.sql` to load sample data.
4.  Create a new application in App Builder based on the tables.
4. Launch the app in Oracle APEX workspace

## 📜 License
MIT License
