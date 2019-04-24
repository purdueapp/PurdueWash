Unit 8: Group Milestone - README Example
===

# Purdue Tracker
Demo video:
<img src="https://github.com/purdueapp/PurdueWash/blob/master/demo.MP4" width=100>

<img src="https://raw.githubusercontent.com/purdueapp/PurdueWash/master/Images/app_icon.jpg" width=100>

<img src="https://raw.githubusercontent.com/purdueapp/PurdueWash/master/Images/purduewash2.gif" width=200>


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

* View buildings with laundry machines and amount that are available
* View status of each machine in a specific building

**Optional Nice-to-have Stories**

* Give notifications when washer is done

### 2. Screen Archetypes

* Buildings with washers
* Washer details

### 3. Navigation

**Single Page Application**

* Laundry Tracker

**Flow Navigation** (Screen to Screen)
* Dorms with washers -> Specific washer avaibility and times

## Wireframes
<img src="https://raw.githubusercontent.com/purdueapp/purduetrackerios/master/Images/wireframes.jpg" width=300><br>

<!--
### [BONUS] Digital Wireframes & Mockups
This was our original idea that we have now dropped.
<img src="https://i.imgur.com/lYHn37F.jpg" height=200>
-->

### [BONUS] Interactive Prototype
This was our original idea that we have now dropped.

<img src="https://raw.githubusercontent.com/moldingtofu/foodcycle/master/demo.gif" width=100>

## Schema 
### Models
#### Laundry Rooms

   | Property         | Type     | Description |
   | ---------------- | -------- | ------------|
   | name             | String   | name of laundry room |
   | availableWashers | Number   | number of washers available |
   | totalWashers     | Number   | total number of washers in laundry room |
   | availableDryers  | Number   | number of dryers available |
   | totalDryers      | Number   | total number of dryers in laundy room |
   | machines         | Array    | holds an array of the machine object in laundry room |

#### Machine

   | Property         | Type     | Description |
   | ---------------- | -------- | ------------|
   | name             | String   | id of machine id |
   | type             | String   | string of washer or dryer |
   | status           | String   | state of the current machine |
   | timeRemaining    | Number   | time left on dryer if running |
 
### Networking
#### List of network requests by screen
  - Home Screen
    - (Read/GET) Query all posts where user is author
      ```swift
      import Alamofire

      Alamofire.request(.GET, "http://data.cs.purdue.edu:8421")
        .response { req, res, data, error in
           // TODO: Display washing machines
           print(res)
        }
      ```
  - Laundry Room Screen
    - (Create/POST) Request notification to be sent when machine is finished

#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://data.cs.purdue.edu:8421](http://data.cs.purdue.edu:8421)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /        | get all laundry data
    `POST`   | /        | request notification alert for machine
