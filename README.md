Unit 8: Group Milestone - README Example
===

# Purdue Tracker

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Tracks what the avaibility of washers, dryers and computer on Purdue's campus

### App Evaluation
- **Category:** Utility
- **Mobile:** This app would be solely developed for mobile because alternative web versions are already available.
- **Story:** Scrapes public websites to provide easy access to info of Purdue's campus
- **Market:** Any individual enrolled at or living at Purdue could choose to use this app,
- **Habit:** This app could be used whenever a student wants to check if washers or computers are available
- **Scope:** First we would start with these services then possibly add more later on

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* View buildings with washers and amount that are available
* View status of each machine in a specific building
* View buildings with computers and amount that are available
* View status of computers in a specific building

**Optional Nice-to-have Stories**

* Images of computer labs in LWSN and HAAS
* Give notifications when washer is done

### 2. Screen Archetypes

* Buildings with washers
* Washer details
* Buildings with Computers
* Computer detail

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Laundry Tracker
* Computer Lab Tracker

**Flow Navigation** (Screen to Screen)
* Dorms with washers -> Specific washer avaibility and times
* Buildings with computers -> Computer avaibility / Either picture or quantity

## Wireframes
<img src="https://raw.githubusercontent.com/purdueapp/purduetrackerios/master/Images/wireframes.jpg" width=800><br>

<!--
### [BONUS] Digital Wireframes & Mockups
This was our original idea that we have now dropped.
<img src="https://i.imgur.com/lYHn37F.jpg" height=200>
-->

### [BONUS] Interactive Prototype
This was our original idea that we have now dropped.

<img src="https://raw.githubusercontent.com/moldingtofu/foodcycle/master/demo.gif" width=200>

## Schema 
### Models
#### Laundry Rooms

   | Property         | Type     | Description |
   | ---------------- | -------- | ------------|
   | name             | String   | unique id for the user post (default field) |
   | imageUrl         | String   | image of laundryRoomDorm |
   | availableWashers | Number   | image caption by author |
   | totalWashers     | Number   | image that user posts |
   | availableDryers  | Number   | number of likes for the post |
   | totalDryers      | Number   | number of comments that has been posted to an image |
   | machines         | Array    | date when post is created (default field) |

#### Machine

   | Property         | Type     | Description |
   | ---------------- | -------- | ------------|
   | machineId        | Number   | image of laundryRoomDorm |
   | type             | String   | unique id for the user post (default field) |
   | status           | String   | image caption by author |
   | timeRemaining    | Number   | image that user posts |
 
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name

##### Game of Thrones API
- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /cities | gets all cities
    `GET`    | /cities/byId/:id | gets specific city by :id
    `GET`    | /continents | gets all continents
    `GET`    | /continents/byId/:id | gets specific continent by :id
    `GET`    | /regions | gets all regions
    `GET`    | /regions/byId/:id | gets specific region by :id
    `GET`    | /characters/paths/:name | gets a character's path with a given name
