CREATE CONSTRAINT developer_name_unique
IF NOT EXISTS
FOR (d:Developer)
REQUIRE d.name IS UNIQUE;

CREATE CONSTRAINT skill_name_unique
IF NOT EXISTS
FOR (s:Skill)
REQUIRE s.name IS UNIQUE;

CREATE CONSTRAINT project_name_unique
IF NOT EXISTS
FOR (p:Project)
REQUIRE p.name IS UNIQUE;

CREATE CONSTRAINT technology_name_unique
IF NOT EXISTS
FOR (t:Technology)
REQUIRE t.name IS UNIQUE;

CREATE CONSTRAINT company_name_unique
IF NOT EXISTS
FOR (c:Company)
REQUIRE c.name IS UNIQUE;

CREATE CONSTRAINT job_role_name_unique
IF NOT EXISTS
FOR (j:JobRole)
REQUIRE j.name IS UNIQUE;