# 📱 IssueSnap - Anonymous Workplace Feedback System
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)

# 🌟 Overview
IssueSnap is a dual-role anonymous feedback platform that empowers employees to speak up about workplace concerns without fear, while giving administrators a clean dashboard to track, manage, and act on issues.

💡 Because the best improvements come from honest feedback

# 🎯 The Problem It Solves

Challenge	Solution

😶 Employees afraid to speak up	 100% anonymous submissions
📸 Issues hard to describe in words	 Image attachment support
📊 Feedback getting lost	 Centralized admin dashboard
🔍 No tracking of resolution	Action tracking per issue
🗑️ Employees can manage their posts	 Self-delete option


# 👥 Two Sides, One Platform

# 👤 Employee Side

## Feature	Description

🕵️ Anonymous Posting	No names, no emails, no tracking
📸 Image Upload	Attach photos to explain issues better
📋 View My Feedback	See all issues you've posted (anonymously)
🗑️ Delete Own Posts	Remove feedback if needed
🔒 True anonymity - just open and post

# 👑 Admin Side

## Feature	Description

📊 Dashboard View	All employee feedback in one place
🔍 Issue Details	View descriptions + attached images
✅ Mark as Reviewed	Track which issues have been seen
🚩 Take Action	Flag issues being addressed
📈 Analytics	See feedback trends over time
🗑️ Manage Content	Remove inappropriate content

# 🔄 How It Works

# Employee Flow
<img width="897" height="2163" alt="" src="https://github.com/user-attachments/assets/795b4005-730b-4e77-a167-352d9499aaab" />


# Admin Flow 

<img width="719" height="2147" alt="" src="https://github.com/user-attachments/assets/941f2413-1a8d-472b-8bc5-5305891c93f7" />

# 📱 App Screens (Detailed)
## 👤 Employee Side Screens

## 🏠 Landing Screen
Two big buttons: I'm an Employee / I'm an Admin

Clean, welcoming UI

## 📝 Submit Feedback Screen
Large text field: "What's bothering you? (Anonymous)"

📎 Attach Image Button (camera/gallery)

📍 Optional: Department/Location dropdown (if configured)

🚀 Submit Anonymously Button

## 📋 My Feedbacks Screen

Grid/list view of all issues posted from this device

Each card shows:

📝 Preview of feedback text

📸 Thumbnail if image attached

🕒 Timestamp

🗑️ Delete icon

Tap to view full details

# 🔍 Feedback Detail Screen (Employee)

Full feedback text

Full-size image (if any)

Upload date/time

🗑️ Delete button with confirmation

# 👑 Admin Side Screens
##  🔐 Admin Login
Secure authentication

Email/password or magic link

## 📊 Admin Dashboard
Stats Cards:

📝 Total feedback received

🆕 New/unread feedback

🚩 Action taken

# Recent feedback list

Filters: All / New / Reviewed / With images

##  📋 All Feedback Screen
Sortable table/list

Columns:

📝 Feedback preview

📸 Image indicator

🕒 Date submitted

👁️ Status (New/Reviewed/Actioned)

⚡ Actions

## 🔍 Feedback Detail Screen 
Full feedback text

Full-size image viewer

Action Panel:

✅ Mark as reviewed

🚩 Flag for action

📝 Add admin notes (private)

🗑️ Delete (if inappropriate)

📧 Forward to HR (optional)

# 🛠️ Tech Stack
Layer	Technology	Purpose
Frontend	Flutter	Cross-platform (iOS/Android/Web)
Backend	Supabase	BaaS + Auth + Database
Database	PostgreSQL	Store feedback & metadata
Storage	Supabase Buckets	Store attached images
Auth	Supabase Auth	Admin authentication
State Management	Getx
Image Picker	image_picker	Camera/gallery access
Image Viewer	photo_view	Fullscreen image viewing

# 🔒 Privacy & Anonymity
Concern	How IssueSnap Handles It
🕵️ Employee identity	❌ No names, emails, or personal data collected
📱 Device tracking	✅ Only anonymous device ID (can't identify person)
🖼️ Image metadata	✅ Stripped before upload
👑 Admin access	🔐 Secure login required
📜 Data retention	🗑️ Configurable auto-delete policy

# 🚀 Setup Instructions

bash
# 1. Clone repository
git clone https://github.com/yourusername/issuesnap.git

# 2. Navigate to project
cd issuesnap

# 3. Install dependencies
flutter pub get

# 4. Create .env file
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_anon_key
SUPABASE_SERVICE_KEY=your_service_key

# 5. Run setup script (optional)
flutter run setup.dart

# 6. Run the app
flutter run

# 📱 App Flow Diagram


                    ┌─────────────────┐
                    │   Landing Page  │
                    │  Employee/Admin │
                    └────────┬────────┘
            ┌───────────────┴────────────────┐
            ↓                                ↓
    ┌───────────────┐                ┌───────────────┐
    │ 👤 Employee  |                │ 👑 Admin      │
    │    Mode       │                │    Login      │
    └───────┬───────┘                └───────┬───────┘
            ↓                                ↓
    ┌───────────────┐                ┌───────────────┐
    │ 📝 Submit     │                │ 📊 Dashboard  │
    │   Feedback    │                │               │
    └───────┬───────┘                └───────┬───────┘
            ↓                                ↓
    ┌───────────────┐                ┌───────────────┐
    │ 📋 My Posts   │                │ 📋 All        │
    │               │                │   Feedback     │
    └───────┬───────┘                └───────┬───────┘
            ↓                                ↓
    ┌───────────────┐                ┌───────────────┐
    │ 🔍 Detail     │                │ 🔍 Detail     │
    │   View        │                │   + Actions   │
    └───────────────┘                └───────────────┘


# 🧪 Use Cases
Scenario	How IssueSnap Helps
🚻 Harassment	Anonymous report with photo evidence
🛠️ Safety hazard	Snap photo, submit instantly
💼 Unfair practices	Speak up without fear
🍽️ Cafeteria issues	Report anonymously
🅿️ Parking problems	Snap and share
👔 Manager behavior	Honest feedback without retaliation

# 🚀 Future Roadmap

🔔 Push notifications for admins

📊 Advanced analytics dashboard

🏢 Multiple company support

📧 Email summaries for admins

🌙 Dark mode

📱 iOS widget for quick submission

🤖 AI sentiment analysis

📎 Multiple image attachments

🗳️ Upvoting on issues

📝 Comment threads (admin-employee anonymous)

🤝 Contributing
This is an open learning project! Feel free to:

🍴 Fork it

🌿 Create feature branch

✨ Make improvements

📤 Submit PR

# All skill levels welcome!

# 📬 Connect
Faizan Sarfraz

GitHub: @chfaizan1537

LinkedIn: https://www.linkedin.com/in/faizan-sarfraz-3b150638b 


Built with: Flutter 💙 + Supabase ⚡

# 📄 License
MIT License - use freely, learn freely, build freely.

# 💬 Final Words

## "The bravest thing you can do is speak up. The smartest thing a company can do is listen."

IssueSnap makes both possible. 🚀

Built with ☕, 🍕, and lots of debugging
Happy coding! 👨‍💻



