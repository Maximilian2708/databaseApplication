**Before you start:** rename this file to `unit3b_lastname.md`, using your own last name. Read `unit3b_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3b — Keys and Relationships

## 1. Which key?

For each table, decide: is the primary key **natural** (a real-world value that already exists, like an email) or **surrogate** (a made-up ID number)? Is it **composite** (more than one column)?

| Table | Primary key | Natural or surrogate? | Composite? |
|---|---|:-:|:-:|
| `teams` in `nba_5seasons.db` | `team_id` |surrogate |yes |
| `player_season_stats` in `nba_5seasons.db` |player_id |surrogate |yes |
| A US state table | `state_abbrev` (OH, MI, PA…) |natural |no |
| The school's student records | `student_id` |surrogate |no |

**a.** The school could use a student's full name as the primary key instead of `student_id`. Give one reason that's a bad idea.

**Answer:**
Because it wouldnt be unique

## 2. What a foreign key promises

**b.** In `denormalized_demo.db`, `games.home_team_id` is a foreign key to `teams.team_id`. If someone tries to insert a game with `home_team_id = 99` and there is no team 99, what should the database do? What is that rule called?

**Answer:**
a database will refuse the entry. this is called referential integrity

**c.** If team 6 were deleted from `teams`, what should happen to its rows in `games`? Name two different choices a designer could make.

**Answer:**
the designer chooses what happens when the foreighn key is sey up. two common choices, block the delete, and deleting the games too

## 3. Sort the relationships

**Choose from:** One-to-one · One-to-many · Many-to-many

| # | Relationship | Type |
|:-:|---|---|
| 1 | One team → its games this season |one to many |
| 2 | Students ↔ the courses they're enrolled in |many to many |
| 3 | A person → their Social Security number |one to one |
| 4 | A customer → their orders |one to many |
| 5 | Movies ↔ the actors in them |many to many |
| 6 | A country → its capital city |one to one |

**d.** Pick either many-to-many row. Relational databases can't store a many-to-many directly. What table do you add, and what columns does it need?

**Answer:**
A seperate table with the keys that relate to the data you are trying to connect

**e.** Not every database uses tables and keys. In a **graph** database (like the one behind Instagram's follow list), the same "who follows whom" relationship is stored as what two things? In a **key-value** store, how is a relationship handled?

**Answer:**
nodes and relationships. in a key-value store, data is saved under one unique key

## 4. Your first ER diagram

Here is the `denormalized_demo.db` fixed version as a Mermaid diagram. It already renders — push and look at it on GitHub or preview it in VS Code.

```mermaid
erDiagram
    TEAMS ||--o{ GAMES : "home team in"
    TEAMS ||--o{ GAMES : "away team in"
    TEAMS {
        int team_id PK
        string full_name
        string city
        string state
    }
    GAMES {
        int game_id PK
        string game_date
        int home_team_id FK
        int away_team_id FK
        int home_pts
        int away_pts
    }
```

**Now make your own, using AI.** Follow the four steps in the walkthrough: plan it, prompt the AI, proof it, test it. A school schedule has these entities: **STUDENTS**, **COURSES**, **TEACHERS**, and an **ENROLLMENTS** junction table. Rules:

- One teacher teaches many courses; each course has one teacher.
- Students take many courses; courses have many students. (That's what ENROLLMENTS is for.)

Give every entity a primary key and at least two attributes. Mark the foreign keys.

```mermaid
erDiagram
    %% replace this comment with your diagram

```

**Paste the prompt you gave the AI.** If you used a PowerPoint picture, add the picture to your repo too.

```text
I'm using the Mermaid Live Editor to create er diagrams. I want you to create a very detailed ER diagram on PGA Tour statistics throughout the last 2 decades. I want you to give me the code so I can copy and paste it into the Mermaid Live Editor and view the diagram myself
```

**f.** Which entity has two foreign keys? What should its primary key be?

**Answer:**
games has 2 foreign keys and game_id should be the primary key.

**g.** What did you have to fix in the AI's diagram? If you didn't change anything, what did you check to make sure it was right?

**Answer:**
that the relationships made enough sense for someone who hasnt seen one of these before looks at it and understands what is going on.

## Closing 3b — Vocabulary

| Term | Your definition |
|---|---|
| Entity |A thing |
| Attribute |values given to a entity |
| Natural key |A key made with a unique letter name that can only be used once |
| Surrogate key |a key that has a number value |
| Composite key |a key that is made up of two foreign keys |
| Referential integrity |making sure the relationships are correct and make sense |
| Junction table |a table that joins multiple peices of data |
| Cardinality |the amount of unique values in a date set |

**Partner check:** trade files. Read your partner's Mermaid code out loud, one relationship line at a time, as English ("one teacher, many courses"). If it doesn't read right, one of you has the crow's foot on the wrong end.
