# 📒 Notes App (Flutter + Supabase + GetX)

A production-ready Notes Application built with **Flutter**, **Supabase**, and **GetX** using clean architecture principles.

This app demonstrates authentication, CRUD operations, like system, profile management, and secure backend policies.

---

## 🚀 Features

### 🔐 Authentication
- User Signup
- User Login
- Logout
- Session Handling
- Secure Auth Flow (Supabase)

### 📝 Notes System
- Create Note
- Edit Note
- Delete Note
- View All Notes (Feed)
- View My Notes (Profile)
- Auto Notes Count (DB Trigger)

### ❤️ Like System
- One user can like a note only once
- Like / Unlike toggle
- Like counter maintained via database trigger
- Foreign key with `ON DELETE CASCADE`
- No duplicate likes (Unique constraint)

### 👤 Profile Screen
- User name & email
- Notes count
- Total likes received
- My notes list
- Logout (Cupertino dialog support)

---

## 🏗 Architecture

This project follows a layered clean architecture:

