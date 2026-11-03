# Insta Feed App

## 📸 Insta Feed – iOS SwiftUI App with Vapor Backend
A simple Instagram-style social media feed application built using **SwiftUI** for the iOS frontend and **Vapor (Swift)** for the backend.

The main objective of this project is to understand how to build a complete iOS application integrated with a custom backend using Vapor REST APIs. The application allows users to create posts with descriptions and view a list of posts fetched from the backend.

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=for-the-badge&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)
![MVVM](https://img.shields.io/badge/MVVM-6C63FF?style=for-the-badge)
![Combine](https://img.shields.io/badge/Combine-007AFF?style=for-the-badge)
![Rest API](https://img.shields.io/badge/REST_API-009688?style=for-the-badge)
![Vapor](https://img.shields.io/badge/Vapor-0D0D0D?style=for-the-badge&logo=vapor&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)

## 🚀 Project Overview
**Insta Feed** is a demo social media application developed to explore modern iOS development with **SwiftUI (async/await, Task)** and backend development using **Vapor**.

The iOS application communicates with the Vapor backend through REST APIs using URLSession.

Users can:
* Create a new feed post.
* Add a description to a post.
* Submit post data to the Vapor backend.
* Fetch all posts from the backend.
* Display posts dynamically in the SwiftUI feed interface.

## 🎥 App Demo
Watch the Insta Feed iOS application in action:




## 🛠️ Technology Stack
### iOS Application
* **Language**: Swift
* **Framework**: SwiftUI
* **Networking**: URLSession
* **Architecture**: MVVM
* **Minimum iOS Version**: iOS 26+
* **Development Tool**: Xcode

### Backend
* **Language**: Swift
* **Framework**: Vapor
* **Database**: PostgreSQL with Fluent ORM
* **API Architecture**: REST API
* **API Testing**: Postman

## ✨ Features
* **Feeds:** Create, view, favourite and save posts.
* **Favorite:** Display favorite posts.
* **User Profile:** View and update profile details.
* **Appearance:** Light, Dark and System modes.
* **Avatar:** Select or update a profile avatar.
* **Theme Customization:** Choose from multiple theme colors (Cyan, Purple, Pink, Orange, Green, Blue, Red and Gold).

## ✨ Implemented Features
### 1. Create Post
* Create a new feed post from the iOS application.
* Enter a post description.
* Send post information to the **Vapor backend through a POST API**.
* Store post information in the **PostgreSQL database**.

### 2. Fetch & Display Posts
* Retrieve all posts from the Vapor backend.
* Integrate the GET API using URLSession.
* Decode JSON responses using Swift Codable.
* Display posts dynamically using SwiftUI views.
* Refresh the feed with backend data.

### 3. Vapor Backend Integration
* Created REST APIs using Vapor.
* Connected Vapor with PostgreSQL.
* Implemented post creation and post listing endpoints.
* Connected the **iOS application with the backend server**.

## 🔗 REST API Endpoints
The following APIs are implemented in the Vapor backend:

| Method | Endpoint | Description |
|:---:|:---|:---|
| `GET` | `/posts` | Fetch all feed posts |
| `POST` | `/posts` | Create a new feed post |

## 🔄 Application Workflow

       iOS SwiftUI App
              |
        URLSession
              |
        Vapor REST API
              |
         PostgreSQL
              |
        Store / Retrieve Posts
              |
        SwiftUI Feed UI





