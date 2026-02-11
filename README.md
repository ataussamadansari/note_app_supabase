# 📒 Notes App (Flutter + Supabase + GetX)

A production-ready Notes Application built with **Flutter**, **Supabase**, and **GetX**, following clean architecture and scalable backend design principles.

This project demonstrates authentication, CRUD operations, like system, profile management, relational database handling, secure RLS policies, and proper state management.

---

## 🚀 Features

### 🔐 Authentication
- User Signup
- User Login
- Secure Logout
- Session Persistence
- Auth State Handling
- Protected Navigation Flow

### 📝 Notes System
- Create Note
- Edit Note
- Delete Note
- Public Notes Feed
- My Notes View (Profile)
- Automatic `notes_count` via DB Trigger

### ❤️ Like System
- One user can like a note only once
- Toggle Like / Unlike
- `UNIQUE(user_id, note_id)` constraint
- Like count maintained via trigger
- `ON DELETE CASCADE` for clean relational deletion
- Optimistic UI updates

### 👤 Profile
- User Name
- Email
- Notes Count
- Total Likes Received
- My Notes List
- Cupertino-style Logout Dialog

---

### 🔹 Architecture Layers

- **UI Layer** → Screens & Widgets
- **Controller Layer** → GetX State Management
- **Repository Layer** → Business Logic
- **Provider Layer** → Supabase Database Calls
- **Database Layer** → PostgreSQL (Supabase)



### 📂 Folder Structure

lib/
│
├── core/
│ └── supabase_constant.dart
│
├── data/
│ ├── models/
│ │ ├── user_model.dart
│ │ └── note_model.dart
│ │
│ ├── providers/
│ │ ├── auth_provider.dart
│ │ ├── note_provider.dart
│ │ ├── profile_provider.dart
│ │ └── like_provider.dart
│ │
│ └── repositories/
│ ├── auth_repository.dart
│ ├── note_repository.dart
│ ├── profile_repository.dart
│ └── like_repository.dart
│
├── controllers/
│ ├── auth_controller.dart
│ ├── note_controller.dart
│ ├── profile_controller.dart
│ └── like_controller.dart
│
├── ui/
│ ├── splash_screen.dart
│ ├── login_screen.dart
│ ├── signup_screen.dart
│ ├── home_screen.dart
│ ├── profile_screen.dart
│ └── create_edit_note_screen.dart
│
└── main.dart


---

## 🗄 Database Design

### 🧑 users
- id (uuid, primary key)
- name
- email
- notes_count (int8)

### 📝 notes
- id
- user_id (FK → users.id)
- title
- description
- like_count (int4)

### ❤️ likes
- id
- user_id (FK → users.id)
- note_id (FK → notes.id)
- UNIQUE(user_id, note_id)
- ON DELETE CASCADE

---

## 🛡 Security (Row Level Security - RLS)

RLS is enabled on all tables.

### Users
- Users can update only their own profile
- Users can view authenticated users

### Notes
- Users can insert only their own notes
- Users can update/delete only their own notes
- Notes visible to authenticated users

### Likes
- Users can like only using their own user_id
- Users can unlike only their own likes
- Duplicate likes prevented via UNIQUE constraint

---

## ⚙️ Environment Setup

Create a `.env` file in project root:

SUPABASE=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key


---

## ▶️ Run Project

```bash
flutter pub get
flutter run
