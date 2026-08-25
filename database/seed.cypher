// ============================================================
// SKILLGRAPH - SEED DATA
// ============================================================

// ------------------------------------------------------------
// SKILLS
// ------------------------------------------------------------

MERGE (s:Skill {name: 'Java'})
SET s.category = 'Programming Language';

MERGE (s:Skill {name: 'Python'})
SET s.category = 'Programming Language';

MERGE (s:Skill {name: 'JavaScript'})
SET s.category = 'Programming Language';

MERGE (s:Skill {name: 'TypeScript'})
SET s.category = 'Programming Language';

MERGE (s:Skill {name: 'React'})
SET s.category = 'Frontend';

MERGE (s:Skill {name: 'Spring Boot'})
SET s.category = 'Backend';

MERGE (s:Skill {name: 'Spring Security'})
SET s.category = 'Backend';

MERGE (s:Skill {name: 'REST API'})
SET s.category = 'Backend';

MERGE (s:Skill {name: 'SQL'})
SET s.category = 'Database';

MERGE (s:Skill {name: 'PostgreSQL'})
SET s.category = 'Database';

MERGE (s:Skill {name: 'MongoDB'})
SET s.category = 'Database';

MERGE (s:Skill {name: 'Docker'})
SET s.category = 'DevOps';

MERGE (s:Skill {name: 'Linux'})
SET s.category = 'Operating System';

MERGE (s:Skill {name: 'Git'})
SET s.category = 'Tools';

MERGE (s:Skill {name: 'AWS'})
SET s.category = 'Cloud';

MERGE (s:Skill {name: 'Data Structures'})
SET s.category = 'Computer Science';

MERGE (s:Skill {name: 'OOP'})
SET s.category = 'Computer Science';

MERGE (s:Skill {name: 'Microservices'})
SET s.category = 'Architecture';

MERGE (s:Skill {name: 'Kafka'})
SET s.category = 'Backend';


// ------------------------------------------------------------
// TECHNOLOGIES
// ------------------------------------------------------------

MERGE (t:Technology {name: 'Java 21'})
SET t.type = 'Language';

MERGE (t:Technology {name: 'Python'})
SET t.type = 'Language';

MERGE (t:Technology {name: 'Spring Boot'})
SET t.type = 'Framework';

MERGE (t:Technology {name: 'React'})
SET t.type = 'Frontend Framework';

MERGE (t:Technology {name: 'PostgreSQL'})
SET t.type = 'Database';

MERGE (t:Technology {name: 'MongoDB'})
SET t.type = 'Database';

MERGE (t:Technology {name: 'Docker'})
SET t.type = 'Containerization';

MERGE (t:Technology {name: 'AWS'})
SET t.type = 'Cloud';

MERGE (t:Technology {name: 'Kafka'})
SET t.type = 'Messaging';

MERGE (t:Technology {name: 'Redis'})
SET t.type = 'Caching';

MERGE (t:Technology {name: 'Node.js'})
SET t.type = 'Runtime';

MERGE (t:Technology {name: 'TypeScript'})
SET t.type = 'Language';

MERGE (t:Technology {name: 'GitHub Actions'})
SET t.type = 'CI/CD';


// ------------------------------------------------------------
// PROJECTS
// ------------------------------------------------------------

MERGE (p:Project {name: 'E-Commerce Platform'})
SET p.description = 'Full-stack platform for online product discovery and ordering';

MERGE (p:Project {name: 'AI Fitness Platform'})
SET p.description = 'Fitness application with personalized workout recommendations';

MERGE (p:Project {name: 'Fleet Management System'})
SET p.description = 'Trip, expense and vehicle management platform';

MERGE (p:Project {name: 'Learning Management System'})
SET p.description = 'Platform for managing courses, lessons and student progress';

MERGE (p:Project {name: 'Food Delivery Platform'})
SET p.description = 'Application connecting customers, restaurants and delivery partners';

MERGE (p:Project {name: 'Banking API'})
SET p.description = 'Secure backend API for banking operations';

MERGE (p:Project {name: 'Real-Time Chat Application'})
SET p.description = 'Real-time messaging platform';

MERGE (p:Project {name: 'Job Recommendation Engine'})
SET p.description = 'Platform for matching candidates with suitable job roles';


// ------------------------------------------------------------
// COMPANIES
// ------------------------------------------------------------

MERGE (c:Company {name: 'TechNova Solutions'})
SET c.industry = 'Software';

MERGE (c:Company {name: 'CloudWorks Technologies'})
SET c.industry = 'Cloud Computing';

MERGE (c:Company {name: 'DataSphere Labs'})
SET c.industry = 'Data & AI';

MERGE (c:Company {name: 'FinEdge Systems'})
SET c.industry = 'FinTech';

MERGE (c:Company {name: 'InnoSoft Technologies'})
SET c.industry = 'Software';

MERGE (c:Company {name: 'NextGen Digital'})
SET c.industry = 'Digital Services';


// ------------------------------------------------------------
// JOB ROLES
// ------------------------------------------------------------

MERGE (r:JobRole {name: 'Java Developer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'Backend Engineer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'Full Stack Developer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'Frontend Developer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'Software Engineer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'Cloud Engineer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'Data Engineer'})
SET r.level = 'Entry';

MERGE (r:JobRole {name: 'DevOps Engineer'})
SET r.level = 'Entry';


// ------------------------------------------------------------
// DEVELOPERS
// ------------------------------------------------------------

MERGE (d:Developer {name: 'Dru'})
SET d.experienceYears = 0,
d.location = 'Chennai';

MERGE (d:Developer {name: 'Chandru'})
SET d.experienceYears = 2,
d.location = 'Bangalore';

MERGE (d:Developer {name: 'Ragul'})
SET d.experienceYears = 3,
d.location = 'Hyderabad';

MERGE (d:Developer {name: 'Ragav'})
SET d.experienceYears = 1,
d.location = 'Chennai';

MERGE (d:Developer {name: 'Keerthika'})
SET d.experienceYears = 4,
d.location = 'Bangalore';

MERGE (d:Developer {name: 'Lavanya'})
SET d.experienceYears = 2,
d.location = 'Pune';

MERGE (d:Developer {name: 'Kaviya'})
SET d.experienceYears = 3,
d.location = 'Chennai';

MERGE (d:Developer {name: 'Nishanth'})
SET d.experienceYears = 5,
d.location = 'Hyderabad';

MERGE (d:Developer {name: 'Sneha K'})
SET d.experienceYears = 1,
d.location = 'Coimbatore';

MERGE (d:Developer {name: 'Vijay'})
SET d.experienceYears = 2,
d.location = 'Bangalore';

MERGE (d:Developer {name: 'Narmatha'})
SET d.experienceYears = 4,
d.location = 'Mumbai';

MERGE (d:Developer {name: 'Sowmiya'})
SET d.experienceYears = 3,
d.location = 'Chennai';


// ============================================================
// DEVELOPER → SKILLS
// ============================================================

MATCH (d:Developer {name: 'Dru'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'SQL',
'React',
'Git',
'OOP',
'REST API',
'Data Structures'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Chandru'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'Spring Security',
'SQL',
'Docker',
'Git',
'Microservices',
'Kafka'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Ragul'})
MATCH (s:Skill)
WHERE s.name IN [
'Python',
'Java',
'SQL',
'AWS',
'Docker',
'Git',
'Data Structures'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Ragav'})
MATCH (s:Skill)
WHERE s.name IN [
'JavaScript',
'TypeScript',
'React',
'Node.js',
'Git',
'REST API'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Keerthika'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'PostgreSQL',
'Docker',
'AWS',
'Microservices',
'Kafka',
'Git'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Lavanya'})
MATCH (s:Skill)
WHERE s.name IN [
'Python',
'MongoDB',
'AWS',
'Docker',
'Git',
'REST API'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Kaviya'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'React',
'SQL',
'Git',
'REST API',
'OOP'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Nishanth'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'Spring Security',
'Docker',
'AWS',
'Microservices',
'Kafka',
'Git',
'SQL'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Sneha K'})
MATCH (s:Skill)
WHERE s.name IN [
'JavaScript',
'React',
'TypeScript',
'Git',
'REST API'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Vijay'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'SQL',
'Docker',
'Git',
'OOP'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Narmatha'})
MATCH (s:Skill)
WHERE s.name IN [
'Python',
'SQL',
'PostgreSQL',
'AWS',
'Docker',
'Kafka',
'Git'
]
MERGE (d)-[:HAS_SKILL]->(s);

MATCH (d:Developer {name: 'Sowmiya'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'MongoDB',
'Docker',
'Git',
'REST API',
'Microservices'
]
MERGE (d)-[:HAS_SKILL]->(s);


// ============================================================
// PROJECT → TECHNOLOGY
// ============================================================

MATCH (p:Project {name: 'E-Commerce Platform'})
MATCH (t:Technology)
WHERE t.name IN [
'Java 21',
'Spring Boot',
'React',
'PostgreSQL',
'Docker',
'Redis',
'GitHub Actions'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'AI Fitness Platform'})
MATCH (t:Technology)
WHERE t.name IN [
'Python',
'React',
'MongoDB',
'AWS',
'Docker'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'Fleet Management System'})
MATCH (t:Technology)
WHERE t.name IN [
'Java 21',
'Spring Boot',
'PostgreSQL',
'React',
'Docker'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'Learning Management System'})
MATCH (t:Technology)
WHERE t.name IN [
'Java 21',
'Spring Boot',
'React',
'PostgreSQL',
'Docker'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'Food Delivery Platform'})
MATCH (t:Technology)
WHERE t.name IN [
'Node.js',
'TypeScript',
'React',
'MongoDB',
'Redis',
'Docker'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'Banking API'})
MATCH (t:Technology)
WHERE t.name IN [
'Java 21',
'Spring Boot',
'PostgreSQL',
'Redis',
'Docker',
'AWS'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'Real-Time Chat Application'})
MATCH (t:Technology)
WHERE t.name IN [
'Node.js',
'TypeScript',
'MongoDB',
'Redis',
'Docker'
]
MERGE (p)-[:USES]->(t);

MATCH (p:Project {name: 'Job Recommendation Engine'})
MATCH (t:Technology)
WHERE t.name IN [
'Python',
'PostgreSQL',
'React',
'AWS',
'Docker'
]
MERGE (p)-[:USES]->(t);


// ============================================================
// DEVELOPER → PROJECT
// ============================================================

MATCH (d:Developer {name: 'Dru'})
MATCH (p:Project {name: 'E-Commerce Platform'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Dru'})
MATCH (p:Project {name: 'Fleet Management System'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Arun Kumar'})
MATCH (p:Project {name: 'Banking API'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Arun Kumar'})
MATCH (p:Project {name: 'E-Commerce Platform'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Priya Sharma'})
MATCH (p:Project {name: 'Job Recommendation Engine'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Karthik Raj'})
MATCH (p:Project {name: 'Food Delivery Platform'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Meena Krishnan'})
MATCH (p:Project {name: 'Banking API'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Meena Krishnan'})
MATCH (p:Project {name: 'Learning Management System'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Rahul Verma'})
MATCH (p:Project {name: 'AI Fitness Platform'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Ananya Iyer'})
MATCH (p:Project {name: 'Learning Management System'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Vikram Singh'})
MATCH (p:Project {name: 'Banking API'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Sneha R'})
MATCH (p:Project {name: 'Real-Time Chat Application'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Aditya Menon'})
MATCH (p:Project {name: 'E-Commerce Platform'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Nisha Patel'})
MATCH (p:Project {name: 'Job Recommendation Engine'})
MERGE (d)-[:WORKED_ON]->(p);

MATCH (d:Developer {name: 'Sanjay Kumar'})
MATCH (p:Project {name: 'Fleet Management System'})
MERGE (d)-[:WORKED_ON]->(p);


// ============================================================
// DEVELOPER → COMPANY
// ============================================================

MATCH (d:Developer {name: 'Dru'})
MATCH (c:Company {name: 'TechNova Solutions'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Arun Kumar'})
MATCH (c:Company {name: 'FinEdge Systems'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Priya Sharma'})
MATCH (c:Company {name: 'DataSphere Labs'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Karthik Raj'})
MATCH (c:Company {name: 'NextGen Digital'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Meena Krishnan'})
MATCH (c:Company {name: 'CloudWorks Technologies'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Rahul Verma'})
MATCH (c:Company {name: 'DataSphere Labs'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Ananya Iyer'})
MATCH (c:Company {name: 'TechNova Solutions'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Vikram Singh'})
MATCH (c:Company {name: 'FinEdge Systems'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Sneha R'})
MATCH (c:Company {name: 'NextGen Digital'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Aditya Menon'})
MATCH (c:Company {name: 'InnoSoft Technologies'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Nisha Patel'})
MATCH (c:Company {name: 'DataSphere Labs'})
MERGE (d)-[:WORKED_AT]->(c);

MATCH (d:Developer {name: 'Sanjay Kumar'})
MATCH (c:Company {name: 'InnoSoft Technologies'})
MERGE (d)-[:WORKED_AT]->(c);


// ============================================================
// COMPANY → JOB ROLE
// ============================================================

MATCH (c:Company {name: 'TechNova Solutions'})
MATCH (r:JobRole)
WHERE r.name IN [
'Java Developer',
'Backend Engineer',
'Full Stack Developer'
]
MERGE (c)-[:OFFERS]->(r);

MATCH (c:Company {name: 'CloudWorks Technologies'})
MATCH (r:JobRole)
WHERE r.name IN [
'Cloud Engineer',
'DevOps Engineer',
'Backend Engineer'
]
MERGE (c)-[:OFFERS]->(r);

MATCH (c:Company {name: 'DataSphere Labs'})
MATCH (r:JobRole)
WHERE r.name IN [
'Data Engineer',
'Software Engineer'
]
MERGE (c)-[:OFFERS]->(r);

MATCH (c:Company {name: 'FinEdge Systems'})
MATCH (r:JobRole)
WHERE r.name IN [
'Java Developer',
'Backend Engineer',
'Software Engineer'
]
MERGE (c)-[:OFFERS]->(r);

MATCH (c:Company {name: 'InnoSoft Technologies'})
MATCH (r:JobRole)
WHERE r.name IN [
'Full Stack Developer',
'Java Developer',
'Software Engineer'
]
MERGE (c)-[:OFFERS]->(r);

MATCH (c:Company {name: 'NextGen Digital'})
MATCH (r:JobRole)
WHERE r.name IN [
'Frontend Developer',
'Full Stack Developer',
'Software Engineer'
]
MERGE (c)-[:OFFERS]->(r);


// ============================================================
// JOB ROLE → REQUIRED SKILLS
// ============================================================

MATCH (r:JobRole {name: 'Java Developer'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'OOP',
'Data Structures',
'Spring Boot',
'SQL',
'Git',
'REST API'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'Backend Engineer'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Spring Boot',
'REST API',
'SQL',
'Docker',
'Git',
'Microservices'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'Full Stack Developer'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'JavaScript',
'React',
'Spring Boot',
'SQL',
'REST API',
'Git'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'Frontend Developer'})
MATCH (s:Skill)
WHERE s.name IN [
'JavaScript',
'TypeScript',
'React',
'Git',
'REST API'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'Software Engineer'})
MATCH (s:Skill)
WHERE s.name IN [
'Java',
'Python',
'Data Structures',
'OOP',
'Git',
'SQL'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'Cloud Engineer'})
MATCH (s:Skill)
WHERE s.name IN [
'AWS',
'Docker',
'Git',
'Linux',
'Python'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'Data Engineer'})
MATCH (s:Skill)
WHERE s.name IN [
'Python',
'SQL',
'PostgreSQL',
'Kafka',
'AWS',
'Git'
]
MERGE (r)-[:REQUIRES]->(s);

MATCH (r:JobRole {name: 'DevOps Engineer'})
MATCH (s:Skill)
WHERE s.name IN [
'Docker',
'AWS',
'Git',
'Python',
'Kafka'
]
MERGE (r)-[:REQUIRES]->(s);


// ============================================================
// RELATED SKILLS
// ============================================================

MATCH (a:Skill {name: 'Java'})
MATCH (b:Skill {name: 'Spring Boot'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Spring Boot'})
MATCH (b:Skill {name: 'Spring Security'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Spring Boot'})
MATCH (b:Skill {name: 'REST API'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Java'})
MATCH (b:Skill {name: 'OOP'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'OOP'})
MATCH (b:Skill {name: 'Data Structures'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'SQL'})
MATCH (b:Skill {name: 'PostgreSQL'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'JavaScript'})
MATCH (b:Skill {name: 'TypeScript'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'TypeScript'})
MATCH (b:Skill {name: 'React'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Docker'})
MATCH (b:Skill {name: 'AWS'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Docker'})
MATCH (b:Skill {name: 'Microservices'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Python'})
MATCH (b:Skill {name: 'Data Structures'})
MERGE (a)-[:RELATED_TO]->(b);

MATCH (a:Skill {name: 'Kafka'})
MATCH (b:Skill {name: 'Microservices'})
MERGE (a)-[:RELATED_TO]->(b);