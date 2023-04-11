Original App Design Project - README Template
===

# BlogShare

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Welcome to BlogShare! You can use this application to read all kinds of blogs posted by others and share your own. You can write blogs, upload pictures, and share it with your friends. Not only that, we also have an AI tool which will summarize your blog post for you so that your audience can see a short summary of your blog post before clicking into it to read it in detail. So get those creative juices flowing and share your blogging talent with the world!

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Productivity/Blog Sharing/Creative writing
- **Mobile:** This app would be primarily developed for mobile.
- **Story:** Users can read other users' blogs, upload their own blogs, and optionally categorize blogs. AI enhances with summaries.
- **Market:** Any individual interested in reading or writing blogs could choose to use this app.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how deep their social life is, and what exactly they're looking for.
- **Scope:** Users can read and write blogs. The app is enhanced using AI for summarization. Optionally we also have the feature to categorize blogs and use the AI to suggest writing topics.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User signs up
* User logs in and is able to read other user blogs
* User writes a blog post
* Ability to add pictures to blog post
* Once user hits share, AI generates overview as seen in Table View
* Summarization of blog post
* Simple search filter, on different tab
* 2 tabs: reading and writing

**Optional Nice-to-have Stories**

* Auto-categorization of blog post using AI
* User picks blog category
* A 3rd tab for category search of blogs
* Button to suggest writing topics/suggestions

### 2. Screen Archetypes

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
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Blogs
    * Table View
    * Detail View
* Write
* Search

Optional:
* Settings

**Flow Navigation** (Screen to Screen)
* Login -> Blogs View
* Blog Selection -> Slide open Blog Detail View
* Write blogs, share button -> Blogs View
* [optional] Settings -> Toggle settings

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
    - GPT-3 model from OpenAI, https://platform.openai.com/docs/libraries
    - 
