```mermaid
erDiagram
    TEAMS ||--o{ GAMES : "plays in"
    TEAMS {
        int team_id PK
        string full_name
    }
    GAMES {
        int game_id PK
        int home_team_id FK
    }
```