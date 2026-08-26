# SkillGraph Frontend

A modern React + Vite frontend for **SkillGraph**, an interactive skill and career knowledge graph.

SkillGraph allows users to explore relationships between:

- Developers
- Skills
- Job Roles
- Related Skills

The frontend communicates with a Spring Boot REST API deployed on Railway, which connects to CognoDB (Neo4j-compatible graph database).

---

## 🚀 Live Application

**Frontend:**
https://skillgraph-silk.vercel.app

**Backend API:**
https://skillgraph-chandru.up.railway.app

---

## 📌 Project Overview

SkillGraph provides an interactive interface for exploring skill-based relationships.

For example, searching for:

```text
Java
```

can reveal:

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

The frontend retrieves this information through REST APIs and presents the data through the SkillGraph interface.

---

# 🛠️ Tech Stack

## Frontend

- React
- Vite
- JavaScript
- Axios
- CSS

## Backend

- Java
- Spring Boot
- Spring REST API

## Database

- CognoDB
- Neo4j-compatible Graph Database
- Cypher

## Deployment

- Vercel — Frontend
- Railway — Backend

---

# 📂 Project Structure

```text
frontend/
│
├── public/
│   ├── favicon.svg
│   └── icons.svg
│
├── src/
│   ├── assets/
│   │
│   ├── api.js
│   ├── App.jsx
│   ├── App.css
│   ├── GraphExplorer.jsx
│   ├── index.css
│   └── main.jsx
│
├── .gitignore
├── eslint.config.js
├── index.html
├── package.json
├── package-lock.json
├── README.md
└── vite.config.js
```

---

# ⚙️ Features

### 🔍 Skill Search

Search for a specific skill such as:

```text
Java
React
Python
Spring Boot
```

---

### 👨‍💻 Developer Discovery

Find developers associated with a particular skill.

Example:

```text
Java
    ↓
Developers
    ↓
Dru
Arun Kumar
Priya Sharma
...
```

---

### 💼 Job Role Discovery

Discover job roles associated with a skill.

Example:

```text
Java
    ↓
Java Developer
Backend Engineer
Full Stack Developer
Software Engineer
```

---

### 🔗 Related Skills

Explore relationships between different technical skills.

Example:

```text
Java
 ├── Spring Boot
 └── OOP
```

---

### 🌐 Interactive Graph

SkillGraph retrieves graph relationships from the backend and represents them as nodes and links.

Example:

```text
Developer:Dru
       │
       │ HAS_SKILL
       ▼
    Skill:Java
       │
       ├──────── RELATED_TO ────────► Skill:Spring Boot
       │
       ├──────── RELATED_TO ────────► Skill:OOP
       │
       ├──────── REQUIRES ──────────► Java Developer
       │
       ├──────── REQUIRES ──────────► Backend Engineer
       │
       └──────── REQUIRES ──────────► Full Stack Developer
```

---

# 🔌 API Integration

The frontend communicates with the Spring Boot backend using Axios.

The API base URL is configured through:

```text
VITE_API_URL
```

Production value:

```text
https://skillgraph-chandru.up.railway.app/api
```

---

# 📡 Available API Endpoints

## Get Skill Details

```http
GET /api/skills?name=Java
```

Returns information about a skill including:

- Developers
- Related skills
- Job roles

---

## Get Developers by Skill

```http
GET /api/developers?skill=Java
```

Returns developers who have the specified skill.

---

## Get Skill Graph

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

## Get Recommendations

```http
GET /api/recommendations?role=Java%20Developer
```

Returns developers whose skills match the requested job role.

---

# 🔐 Environment Variables

The frontend uses Vite environment variables.

Create a `.env` file for local development:

```env
VITE_API_URL=http://localhost:8080/api
```

For production, configure the variable in Vercel:

```env
VITE_API_URL=https://skillgraph-chandru.up.railway.app/api
```

> Never commit `.env` files containing private credentials.

---

# 💻 Local Development

## 1. Clone the Repository

```bash
git clone https://github.com/iam-chandru-selvam/Skillgraph.git
```

Navigate into the project:

```bash
cd Skillgraph/frontend
```

---

## 2. Install Dependencies

```bash
npm install
```

---

## 3. Configure API URL

Create:

```text
.env
```

Add:

```env
VITE_API_URL=http://localhost:8080/api
```

Make sure the Spring Boot backend is running locally.

---

## 4. Start Development Server

```bash
npm run dev
```

The application will normally be available at:

```text
http://localhost:5173
```

---

# 🏗️ Production Build

Create an optimized production build:

```bash
npm run build
```

The production files will be generated inside:

```text
dist/
```

---

# 👀 Preview Production Build

After building:

```bash
npm run preview
```

---

# 🚀 Deployment

The frontend is deployed using **Vercel**.

### Deployment Configuration

```text
Framework:
Vite

Root Directory:
frontend

Build Command:
npm run build

Output Directory:
dist
```

### Production Environment Variable

```text
VITE_API_URL=https://skillgraph-chandru.up.railway.app/api
```

Every push to the connected GitHub repository can trigger a new Vercel deployment.

---

# 🌐 Production Architecture

```text
                    ┌─────────────────────────┐
                    │        User Browser     │
                    └────────────┬────────────┘
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │        Vercel           │
                    │    React + Vite         │
                    │ skillgraph-silk.vercel  │
                    └────────────┬────────────┘
                                 │
                            HTTPS / REST
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │       Railway           │
                    │    Spring Boot API      │
                    │ skillgraph-chandru...   │
                    └────────────┬────────────┘
                                 │
                            Neo4j Driver
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │        CognoDB          │
                    │   Graph Database        │
                    └─────────────────────────┘
```

---

# 🔄 Data Flow

When a user searches for a skill:

```text
User searches "Java"
        ↓
React Application
        ↓
Axios API Request
        ↓
GET /api/graph?name=Java
        ↓
Spring Boot Backend
        ↓
GraphRepository
        ↓
Cypher Query
        ↓
CognoDB
        ↓
Graph Data
        ↓
Spring Boot JSON Response
        ↓
React
        ↓
SkillGraph Visualization
```

---

# 🧪 Example Production Request

```http
GET https://skillgraph-chandru.up.railway.app/api/graph?name=Java
```

The API returns graph information containing:

```text
Developers
Skills
Job Roles
Relationships
```

---

# 🛡️ CORS

The backend allows requests from the production Vercel frontend:

```text
https://skillgraph-silk.vercel.app
```

Local development is also supported:

```text
http://localhost:5173
```

---

# 📦 NPM Scripts

Available scripts:

```bash
npm run dev
```

Starts the Vite development server.

```bash
npm run build
```

Creates the production build.

```bash
npm run preview
```

Previews the production build locally.

```bash
npm run lint
```

Runs ESLint checks.

---

# 🧹 Code Quality

The project uses ESLint for JavaScript and React code quality.

Run:

```bash
npm run lint
```

before committing major changes.

---

# 🔮 Future Improvements

Planned improvements include:

- Interactive graph node selection
- Detailed developer profiles
- Skill recommendations
- Job-role recommendations
- Skill gap analysis
- Advanced graph filtering
- Authentication
- User profiles
- Personalized career recommendations
- Improved graph visualization
- Dark mode
- Mobile optimization
- API caching
- Better loading and error states

---

# 🤝 Contributing

Contributions are welcome.

### 1. Fork the repository

```bash
git fork https://github.com/iam-chandru-selvam/Skillgraph
```

### 2. Create a feature branch

```bash
git checkout -b feature/new-feature
```

### 3. Make your changes

### 4. Commit

```bash
git commit -m "Add new feature"
```

### 5. Push

```bash
git push origin feature/new-feature
```

### 6. Create a Pull Request

---

# 👨‍💻 Author

**Dru (Chandru Selvam)**

Computer Science & Engineering

GitHub: [https://github.com/iam-chandru-selvam](https://github.com/iam-chandru-selvam)

---

# 🔗 Project Links

### Live Frontend

[https://skillgraph-silk.vercel.app](https://skillgraph-silk.vercel.app)

### Backend API

[https://skillgraph-chandru.up.railway.app](https://skillgraph-chandru.up.railway.app)

### GitHub Repository

[https://github.com/iam-chandru-selvam/Skillgraph](https://github.com/iam-chandru-selvam/Skillgraph)

---

# ⭐ SkillGraph

A full-stack knowledge graph platform connecting:

```text
Skills
   ↕
Developers
   ↕
Job Roles
   ↕
Related Skills
```

Built with:

```text
React + Vite
      +
Spring Boot
      +
CognoDB / Neo4j
      +
Vercel + Railway
```

---

## 📄 License

This project is currently intended for educational, portfolio, and demonstration purposes.
