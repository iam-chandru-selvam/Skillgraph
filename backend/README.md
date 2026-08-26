# SkillGraph Backend

The backend service for **SkillGraph**, a full-stack skill and career knowledge graph application.

The backend is built with **Java and Spring Boot** and provides REST APIs for querying developers, skills, job roles, and graph relationships stored in **CognoDB**, a Neo4j-compatible graph database.

---

# 🚀 Live Backend

**Production API:**

https://skillgraph-chandru.up.railway.app

**Frontend:**

https://skillgraph-silk.vercel.app

**GitHub Repository:**

https://github.com/iam-chandru-selvam/Skillgraph

---

# 📌 Project Overview

SkillGraph models relationships between:

- Developers
- Skills
- Job Roles
- Related Skills

The backend exposes REST APIs that allow the frontend to query this graph.

For example, querying:

```text
Java
```

can return:

```text
Java
├── Developers
│   ├── Dru
│   ├── Arun Kumar
│   ├── Priya Sharma
│   └── ...
│
├── Related Skills
│   ├── Spring Boot
│   └── OOP
│
└── Job Roles
    ├── Java Developer
    ├── Backend Engineer
    ├── Full Stack Developer
    └── Software Engineer
```

---

# 🛠️ Technology Stack

## Backend

- Java 21
- Spring Boot
- Spring Web
- Maven
- REST APIs

## Graph Database

- CognoDB
- Neo4j-compatible database
- Neo4j Java Driver
- Cypher

## Deployment

- Railway

## Development Tools

- IntelliJ IDEA
- Visual Studio Code
- Git
- GitHub
- PowerShell

---

# 🏗️ Architecture

```text
                    ┌──────────────────────────┐
                    │      React Frontend      │
                    │          Vercel          │
                    └────────────┬─────────────┘
                                 │
                                 │ HTTPS / REST
                                 ▼
                    ┌──────────────────────────┐
                    │      Spring Boot API     │
                    │         Railway          │
                    └────────────┬─────────────┘
                                 │
                                 │ Neo4j Driver
                                 ▼
                    ┌──────────────────────────┐
                    │         CognoDB           │
                    │    Graph Database         │
                    └──────────────────────────┘
```

---

# 📂 Project Structure

```text
backend/
│
├── .mvn/
│   └── wrapper/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── dru/
│   │   │           └── Skillgraph/
│   │   │               │
│   │   │               ├── SkillgraphApplication.java
│   │   │               │
│   │   │               ├── config/
│   │   │               │   ├── CognoDbConfig.java
│   │   │               │   ├── DatabaseSeeder.java
│   │   │               │   └── WebConfig.java
│   │   │               │
│   │   │               ├── controller/
│   │   │               │   ├── CognoDbTestController.java
│   │   │               │   └── GraphController.java
│   │   │               │
│   │   │               ├── exception/
│   │   │               │   └── GlobalExceptionHandler.java
│   │   │               │
│   │   │               ├── repository/
│   │   │               │   └── GraphRepository.java
│   │   │               │
│   │   │               └── service/
│   │   │                   ├── CognoDbTestService.java
│   │   │                   └── GraphService.java
│   │   │
│   │   └── resources/
│   │       └── application.properties
│   │
│   └── test/
│       └── java/
│           └── com/
│               └── dru/
│                   └── Skillgraph/
│                       └── SkillgraphApplicationTests.java
│
├── pom.xml
├── mvnw
└── mvnw.cmd
```

---

# 🧩 Backend Layers

The backend follows a simple layered architecture.

```text
Controller
    ↓
Service
    ↓
Repository
    ↓
Neo4j Driver
    ↓
CognoDB
```

---

# 🎮 Controllers

## GraphController

`GraphController` exposes the main SkillGraph APIs.

### Developers by Skill

```http
GET /api/developers?skill=Java
```

Example:

```text
/api/developers?skill=React
```

Returns developers who have the requested skill.

---

## Skill Details

```http
GET /api/skills?name=Java
```

Returns:

- Skill name
- Developers
- Related skills
- Job roles

Example response:

```json
{
  "skill": "React",
  "developers": [
    {
      "name": "Dru",
      "location": "Chennai",
      "experienceYears": 0
    }
  ],
  "relatedSkills": [
    "TypeScript"
  ],
  "jobRoles": [
    "Full Stack Developer",
    "Frontend Developer"
  ]
}
```

---

## Skill Graph

```http
GET /api/graph?name=Java
```

Returns graph nodes and relationships.

Example:

```json
{
  "nodes": [
    {
      "id": "Skill:Java",
      "label": "Java",
      "type": "Skill"
    }
  ],
  "links": [
    {
      "source": "Developer:Dru",
      "target": "Skill:Java",
      "label": "HAS_SKILL"
    }
  ]
}
```

---

## Recommendations

```http
GET /api/recommendations?role=Java%20Developer
```

Returns developers whose skills match the requested job role.

---

# 🧪 CognoDB Connection Test

The backend provides a simple endpoint to verify the graph database connection.

```http
GET /api/cognodb/test
```

Expected response:

```text
CognoDB connection successful
```

This endpoint is useful for verifying:

```text
Spring Boot
      ↓
Neo4j Driver
      ↓
CognoDB
```

---

# 🗄️ Database

SkillGraph uses **CognoDB** as its graph database.

The database stores nodes such as:

```text
Developer
Skill
JobRole
```

and relationships such as:

```text
HAS_SKILL
RELATED_TO
REQUIRES
```

---

# 🔗 Graph Model

The core graph model looks like:

```text
Developer
    │
    │ HAS_SKILL
    ▼
  Skill
    │
    │ RELATED_TO
    ▼
  Skill

JobRole
    │
    │ REQUIRES
    ▼
  Skill
```

Example:

```text
Dru
 │
 │ HAS_SKILL
 ▼
Java
 │
 ├── RELATED_TO ──► Spring Boot
 │
 ├── RELATED_TO ──► OOP
 │
 ├── ◄── REQUIRES ── Java Developer
 │
 ├── ◄── REQUIRES ── Backend Engineer
 │
 └── ◄── REQUIRES ── Full Stack Developer
```

---

# 🔍 Repository Queries

`GraphRepository` contains the Cypher queries used to retrieve graph information.

## Find Developers by Skill

```cypher
MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)
WHERE toLower(s.name) = toLower($skillName)
RETURN d.name AS developer,
       d.location AS location,
       d.experienceYears AS experienceYears
ORDER BY d.name
```

---

## Find Skill Details

The backend retrieves:

```text
Skill
Developers
Related Skills
Job Roles
```

using Cypher `OPTIONAL MATCH` queries.

---

## Find Skill Graph

The graph endpoint combines three relationship queries:

```text
Developer → Skill
Skill → Related Skill
JobRole → Skill
```

The backend converts the results into:

```json
{
  "nodes": [],
  "links": []
}
```

which can be consumed directly by the React graph visualization.

---

# ⚙️ Configuration

Application configuration is stored in:

```text
src/main/resources/application.properties
```

The application uses environment variables for database credentials.

Example configuration:

```properties
cognodb.uri=${COGNODB_URI}
cognodb.username=${COGNODB_USERNAME}
cognodb.password=${COGNODB_PASSWORD}
```

> Never commit real database credentials to GitHub.

---

# 🔐 Environment Variables

The backend requires the following environment variables:

```text
COGNODB_URI
COGNODB_USERNAME
COGNODB_PASSWORD
```

Example:

```text
COGNODB_URI=bolt+s://your-database-host
COGNODB_USERNAME=your-username
COGNODB_PASSWORD=your-password
```

Use your actual CognoDB credentials in the deployment environment.

---

# 🌱 Database Seeding

The project contains database seed files:

```text
database/
├── schema.cypher
└── seed.cypher
```

The seed data creates sample:

- Developers
- Skills
- Job Roles
- Skill relationships

The graph used during development contains populated nodes and relationships for testing the SkillGraph APIs.

---

# 💻 Local Development

## 1. Clone the Repository

```bash
git clone https://github.com/iam-chandru-selvam/Skillgraph.git
```

Navigate into the backend:

```bash
cd Skillgraph/backend
```

---

# 2. Configure Environment Variables

Set:

```text
COGNODB_URI
COGNODB_USERNAME
COGNODB_PASSWORD
```

Example on Windows PowerShell:

```powershell
$env:COGNODB_URI="your-cognodb-uri"
$env:COGNODB_USERNAME="your-username"
$env:COGNODB_PASSWORD="your-password"
```

---

# 3. Run the Application

Using Maven Wrapper:

```powershell
.\mvnw.cmd spring-boot:run
```

The backend normally starts on:

```text
http://localhost:8080
```

---

# 🏗️ Build the Project

Create a production build:

```powershell
.\mvnw.cmd clean package
```

Expected result:

```text
BUILD SUCCESS
```

The generated JAR will be placed inside:

```text
target/
```

---

# 🧪 Run Tests

```powershell
.\mvnw.cmd test
```

---

# 🔎 Local API Testing

## CognoDB Test

```text
http://localhost:8080/api/cognodb/test
```

Expected:

```text
CognoDB connection successful
```

---

## Skill Details

```text
http://localhost:8080/api/skills?name=Java
```

---

## Developers

```text
http://localhost:8080/api/developers?skill=Java
```

---

## Graph

```text
http://localhost:8080/api/graph?name=Java
```

---

## Recommendations

```text
http://localhost:8080/api/recommendations?role=Java%20Developer
```

---

# 🚀 Production Deployment

The backend is deployed using **Railway**.

Production URL:

```text
https://skillgraph-chandru.up.railway.app
```

Railway builds and runs the Spring Boot application from the backend project.

---

# ☁️ Railway Configuration

The backend requires:

```text
COGNODB_URI
COGNODB_USERNAME
COGNODB_PASSWORD
```

to be configured as Railway environment variables.

The application listens on the port provided by the deployment environment.

---

# 🌐 CORS

The backend allows the production Vercel frontend:

```text
https://skillgraph-silk.vercel.app
```

and local development:

```text
http://localhost:5173
```

This allows the React frontend to communicate with the Spring Boot API from the browser.

---

# 🔄 Production Data Flow

When a user searches for a skill:

```text
User
 ↓
React / Vercel
 ↓
GET /api/graph?name=Java
 ↓
Spring Boot / Railway
 ↓
GraphController
 ↓
GraphService
 ↓
GraphRepository
 ↓
Neo4j Driver
 ↓
CognoDB
 ↓
Cypher Query
 ↓
Graph Data
 ↓
JSON Response
 ↓
React Graph Visualization
```

---

# 📊 Example Production Graph

For:

```http
GET /api/graph?name=Java
```

the graph can contain:

```text
Developers
    ↓
Java
    ↓
Spring Boot
    ↓
OOP

Java
    ↓
Java Developer
    ↓
Backend Engineer
    ↓
Full Stack Developer
    ↓
Software Engineer
```

---

# 🛡️ Error Handling

The backend contains a global exception handler:

```text
GlobalExceptionHandler
```

This provides a consistent API response when unexpected server-side errors occur.

---

# 🔧 Development Commands

### Run application

```bash
./mvnw spring-boot:run
```

Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

### Build

```bash
./mvnw clean package
```

Windows:

```powershell
.\mvnw.cmd clean package
```

### Test

```bash
./mvnw test
```

Windows:

```powershell
.\mvnw.cmd test
```

---

# 🧹 Git

The project excludes generated build artifacts:

```text
**/target/
```

Environment files:

```text
.env
.env.*
```

and other local development files are excluded through `.gitignore`.

---

# 🔮 Future Improvements

Potential backend improvements include:

- Spring Security
- JWT authentication
- User accounts
- Advanced skill recommendations
- Skill-gap analysis
- Career-path recommendations
- Pagination
- API validation
- API documentation with Swagger/OpenAPI
- Caching
- Rate limiting
- Improved exception handling
- Unit and integration testing
- Docker containerization
- CI/CD pipeline
- Production monitoring
- Health checks
- Structured logging

---

# 🤝 Contributing

Contributions are welcome.

### Create a feature branch

```bash
git checkout -b feature/new-feature
```

### Make changes

### Commit

```bash
git add .
git commit -m "Add new feature"
```

### Push

```bash
git push origin feature/new-feature
```

Then create a Pull Request.

---

# 👨‍💻 Author

**Chandru (Chandru Selvam)**

Computer Science & Engineering Graduate

GitHub: [https://github.com/iam-chandru-selvam](https://github.com/iam-chandru-selvam)

---

# 🔗 Project Links

### 🌐 Live Frontend

[https://skillgraph-silk.vercel.app](https://skillgraph-silk.vercel.app)

### ⚙️ Production Backend

[https://skillgraph-chandru.up.railway.app](https://skillgraph-chandru.up.railway.app)

### 📦 GitHub Repository

[https://github.com/iam-chandru-selvam/Skillgraph](https://github.com/iam-chandru-selvam/Skillgraph)

---

# ⭐ SkillGraph

SkillGraph is a full-stack knowledge graph application that connects:

```text
Developers
    ↕
Skills
    ↕
Job Roles
    ↕
Related Skills
```

Built using:

```text
Java
Spring Boot
Neo4j Driver
CognoDB
Cypher
Maven
React
Vite
Vercel
Railway
```

---

## 📄 License

This project is currently intended for educational, portfolio, and demonstration purposes.
