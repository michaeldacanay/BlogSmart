# BlogSmart

## Table of Contents
1. [Overview](#Overview)
2. [Project Setup](#Project-Setup)
3. [DEMO : Video Walkthrough] (#Demo-(Video-Walkthrough))
4. [Product Spec](#Product-Spec)
5. [Wireframes](#Wireframes)
6. [Schema](#Schema)

## Overview
### Description
Welcome to BlogSmart! You can use this application to read all kinds of blogs posted by others and share your own. You can write blogs, upload pictures, and share it with your friends. Not only that, we also have an AI tool which will summarize your blog post for you so that your audience can see a short summary of your blog post before clicking into it to read it in detail. So get those creative juices flowing and share your blogging talent with the world!

### App Evaluation

- **Category:** Productivity/Blog Sharing/Creative writing
- **Mobile:** This app would be primarily developed for mobile.
- **Story:** Users can read other users' blogs, upload their own blogs, and optionally categorize blogs. AI enhances with summaries.
- **Market:** Any individual interested in reading or writing blogs could choose to use this app.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how deep their social life is, and what exactly they're looking for.
- **Scope:** Users can read and write blogs. The app is enhanced using AI for summarization. Optionally we also have the feature to categorize blogs and use the AI to suggest writing topics.

## Project Setup
1. Pull the repo from main branch to your local machine
2. Make sure you have a Mac with an updated version of XCode
3. Open the project in Xcode
4. Create `keys.plist` in project root directory, add **`OPENAI_API_KEY`** (as key) with your own API key (as the value). You can request an API from OpenAI [here] (https://platform.openai.com/.)

## Demo (Video Walkthrough)

## Product Spec

### **App color Theme:** Orange & White

### **1. User Stories** (Required and Optional)

**Required Must-have Stories**

[x] User can sign up and create a new account
[x] User can log in and is able to read other user blogs
[x] User can writes their own blog post
[x] User can choose a picture for their own blog post
[x] Once user hits share, AI generates a blog summary which can be seen in the main Blog Feed Page
[x] Summarization of blog post content by an AI
[x] User can use simple search to search for blogs on the Blog Feed Page
[x] User can navigate between 2 tabs: Read and Write

**Optional Nice-to-have Stories**

* Auto-categorization of blog post using AI
* User picks blog category
* A 3rd tab for category search of blogs
* Button to suggest writing topics/suggestions

### **2. Screen Archetypes**

* Login 
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in
* Blog Table View Screen
   * Upon signing in, blog posts are displayed
   * Each blog post shows title and AI-generated overview
* Write Blog Screen 
   * Allows user to write a blog
   * Post button
   * Photo icon to open photo library
   * optional: suggest button
* Search Screen
   * Search bar
   * Blogs in table view
   * potentially, combine with Blog Table View Screen
* Settings Screen (optional)
   * Lets people change app notification settings.
   
### **3. Navigation**

**Tab Navigation** (Tab to Screen)

* Log In Page
* Sign Up Page
* Blog Feed
    * Table View
    * Detail View
    * Search Functionality
* Write

Optional:
* Settings

**Flow Navigation** (Screen to Screen)
* Login (click on Sign Up) -> Sign Up
* Login -> Blogs View
* Blog Selection -> Slide open Blog Detail View
* Write blogs, share button -> Blogs View
* [optional] Settings -> Toggle settings

## Wireframes
The Wireframes say "BlogShare" as the app name because we weren't sure of the final name of the app when designing the wireframes.

<img src="https://i.imgur.com/2RwxxEk.jpg" width=700>

### Digital Wireframes & Mockups
<img src="https://i.imgur.com/c9RSNrL.png" width=700>
<img src="https://i.imgur.com/WyAoGg2.png" width=700>

## Schema 

** Post: **
    - Object ID
    - Summary
    - ACL
    - user
    - updatedAt
    - imageFile
    - title
    - content
    - createdAt

### Networking
- Parse Back4App DB, https://parse-dashboard.back4app.com/apps
- GPT-3 model from OpenAI, https://platform.openai.com/docs/libraries
