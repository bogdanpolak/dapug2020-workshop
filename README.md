# DAPUG Workshop 2020-04

## Location

Hotel Hesselet - Nyborg  [Google maps link](https://www.google.dk/maps/place/Hotel+Hesselet/@55.320175,10.8081974,17z/data=!3m1!4b1!4m8!3m7!1s0x464d3efe22ab0437:0x54d922fbc7d9d314!5m2!4m1!1i2!8m2!3d55.320175!4d10.8103861)

## Agenda

This workshop will help you working with and improving large legacy VCL applications. The foundation of software engineering is code improvements which requires existing code refactoring. However, for VCL projects, such changes have a high risk of introducing many defects, because usually in these projects test coverage is too weak or even there is no unit-tests at all.

During the workshop, we will practice how to split up a monolithic VCL project into smaller pieces, and then cover them with an automated tests. Because monolithic systems are becoming too large to deal with, many companies are trying to break them. Increasing pressure from the microservices solutions forcing companies to change. This workshop will help Delphi developers to be better prepared for upcoming challenges and practice refactoring techniques in advance.

Day 1 will be dedicated to the use of class helpers and writing unit tests. We will introduce TDD approach, improve code readability and reuse and we will reduce lines of code in the forms.

Day 2 will learn how to extract business logics and how to test it. We will introduce two patterns: (1) Delphi Command Pattern which helps in extraction of long methods and (2) Delphi Data Proxy Pattern which helps in extraction of business logic which is strongly dependant on TDataSet component.

Used patterns and libraries:
  - https://github.com/bogdanpolak/class-helpers
  - https://github.com/bogdanpolak/command-delphi
  - https://github.com/bogdanpolak/delphi-dataproxy

## About speaker

Bogdan Polak is a Polish developer living both in Scotland and Poland. His professional expertise is refactoring and code modernisation. Working as Software Engineer in Craneware - Edinburgh based software house delivering cloud based solutions that improving financial performance of US hospitals. He is a well known Delphi speaker, trainer and coach in Polish area. For 15 years was working in BSC Polska - local Embarcadero Partner company. Also an active member of European Delphi community: speaker of the EKON, Delphi Day and ITDevCon conferences. Privately loves his family (wife, son and twin daughters), his passion is sport, the top one are sailing and skiing.

## PROGRAM - Day 1 - 28th April

| Time | Subcject | Details |
| --- | --- | --- |

| 09:30 | Welcome / Large projects refactoring |Introduction to challenges and requirements needed to improve legacy VCL Forms application. How to break the barrier of fear of change? How to protect against mistakes? |
| 10:10 | Class helpers & DUnitX |Class helpers as an example of very low risk refactoring and very easy array to implement and improve unit testing skills |
| 11:00 | Extracting utility functions | Review of possible use of class and record helpers. Practical examples. Selecting and introducing good candidates for the helpers |
| 12:00 | Lunch | |
| 13:00 | Helper Good practices | Understanding the “dark side of class helpers”. Overview of helpers good and inconvenient candidates. Test-first approach. |
| 14:10 | Test Drive Development | Incremental and high velocity Red-Green-Refactor cycles. Using TDD technique for expanding helpers library. |
| 15:10 | Helpers maintenance | Class helpers library as an independent project. Planing, branching model and release cycle. Continuous integration (CI/CD process). |

## PROGRAM - Day 2 - 29th April

| 09:00 | Breaking out big method | Extracting big methods containing important business logic into separate class using Delphi Command Pattern. Copy-Paste technique. Injecting dependencies. |
| 10:10 | Removing UI dependencies | Cleaning extracted business logic by removing all visual dependencies. Refreshing and notify visual controls. Removing other irrelevant dependencies and the breaking down long method code into smaller more logical pieces |
| 11:10 | Coding against the interface | Applying Dependency Invention Principle and Interface Segregation Principle. Testable and non-testable code. Working with project using many interfaces. |
| 12:00 | Lunch | |
| 13:00 | Dealing with the datasets | Using Delphi Data Proxy Pattern. Fighting with mixing business logic with data manipulation and data management code. Improving strongly coupled (spaghetti) code. Replacing SQL datasets with fake memory ones. |
| 14:10 | Mocking dependencies | Extracting external dependencies from business logic. Testing data proxy in isolation. Learning Delphi Mock Framework. Mock vs Fakes. Testing private methods of bigger class. |
| 15:10 | Decomposing extracted items | Decomposing big classes into smaller ones. Safe vs dangerous refactoring. Constructor injection and composing more general classes form smaller items. Application composer and Dependency Injection Container. |
