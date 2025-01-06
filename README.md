# PL/SQL PROJECT
**Developer**: Chaitanya Pravin Thorat                              
**Third Year Computer Engineering Student** at Amrutvahini College of Engineering.  
**Contact**: chaitanyathorat@gmail.com  

# Event Management System

## Project Overview
The Event Management System is a robust and user-friendly database application designed to
streamline the process of managing events, venues, and participants. It allows organizations to
efficiently handle event bookings, check venue availability, and manage participant information. 
This system ensures seamless coordination by leveraging SQL queries, PL/SQL procedures, and triggers to 
automate and enforce business rules, such as preventing double-booking of venues.

# Description
The system is built to provide a comprehensive solution for event planners and administrators to 
manage multiple aspects of event planning and execution. It incorporates features to handle tasks
like booking events, managing venue schedules, calculating event costs, and generating reports. 
Using SQL and PL/SQL, the system enables advanced functionalities such as checking venue 
availability,calculating costs dynamically based on resources, and ensuring data consistency through 
triggers.
The database schema includes key entities such as Events, Venues, Participants, and Bookings.
Relationships between these entities facilitate efficient data management and retrieval. The system 
enforces constraints to maintain data integrity and employs stored procedures and triggers for 
automation.

## Features
- **Venue Managemen**: Check venue availability for specific dates using SQL queries.
                       Automatically prevent double-booking through triggers.
                       Store and manage details about multiple venues, such as location and capacity.
- **Event Management**: Create, update, and delete events with associated details like name, organizer, and date.
                        Track and manage bookings for various events.
- **Participant Management**: Maintain participant information, including names, contact details, and
                              event association.
                              Query participant lists for specific events.
- **Cost Calculation**: Use PL/SQL procedures to calculate event costs dynamically based on allocated resources and duration.
- **Data Integrity and Automatio**: Triggers ensure data consistency, such as preventing duplicate bookings.
                                    Enforce constraints to maintain referential integrity between entities.
- **Scalability**: The system is designed to handle multiple events, venues, and participants, making it
                   suitable for large-scale operations.

## Technologies Used
- Oracle SQL
- PL/SQL
