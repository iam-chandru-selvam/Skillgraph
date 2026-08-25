import { useState } from "react";
import {
  Search,
  X,
  Users,
  GitBranch,
  BriefcaseBusiness,
  MapPin,
  Code2,
  ArrowRight,
  LoaderCircle,
  AlertCircle,
} from "lucide-react";

import {
  getSkillDetails,
  getRecommendations,
} from "./api";

import GraphExplorer from "./GraphExplorer";

import "./App.css";

const popularSkills = [
  "Java",
  "Spring Boot",
  "React",
  "Python",
  "Docker",
  "SQL",
];

const popularRoles = [
  "Java Developer",
  "Backend Engineer",
  "Full Stack Developer",
];

function App() {
  const [search, setSearch] = useState("");
  const [selectedSkill, setSelectedSkill] = useState(null);
  const [skillData, setSkillData] = useState(null);

  const [selectedRole, setSelectedRole] = useState(null);
  const [recommendations, setRecommendations] = useState([]);

  const [loading, setLoading] = useState(false);
  const [roleLoading, setRoleLoading] = useState(false);
  const [error, setError] = useState("");

  const [searchTerm, setSearchTerm] = useState("");

  const [showGraph, setShowGraph] = useState(false);

  const filteredSkills = popularSkills.filter((skill) =>
    skill.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const searchSkill = async (skill) => {
    const cleanSkill = skill.trim();

    if (!cleanSkill) {
      return;
    }

    setLoading(true);
    setError("");
    setSelectedSkill(cleanSkill);
    setSelectedRole(null);
    setRecommendations([]);

    try {
      const data = await getSkillDetails(cleanSkill);

      if (!data || !data.skill) {
        setSkillData(null);
        setError(`No skill found for "${cleanSkill}".`);
        return;
      }

      setSkillData(data);
    } catch (err) {
      console.error(err);
      setSkillData(null);
      setError(
        "Unable to reach SkillGraph. Please make sure the backend is running."
      );
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = (event) => {
    event.preventDefault();
    searchSkill(search);
  };

  const selectPopularSkill = (skill) => {
    setSearch(skill);
    searchSkill(skill);
  };

  const loadRecommendations = async (role) => {
    setRoleLoading(true);
    setError("");
    setSelectedRole(role);

    try {
      const data = await getRecommendations(role);
      setRecommendations(data || []);
    } catch (err) {
      console.error(err);
      setRecommendations([]);
      setError(
        "Unable to load recommendations. Please make sure the backend is running."
      );
    } finally {
      setRoleLoading(false);
    }
  };

  return (
    <div className="app">

      {/* Header */}
      <header className="header">
        <div className="brand">
          <div className="brand-icon">
            <GitBranch size={22} />
          </div>

          <div>
            <h1>SkillGraph</h1>
            <span>Graph-powered talent explorer</span>
          </div>
        </div>

        <div className="status">
          <span className="status-dot"></span>
          CognoDB Connected
        </div>
      </header>

      {/* Hero */}
      <main>
        <section className="hero">

          <div className="hero-content">
            <div className="eyebrow">
              <Code2 size={16} />
              EXPLORE THE SKILL GRAPH
            </div>

            <h2>
              Discover connections between
              <span> skills, people & opportunities.</span>
            </h2>

            <p>
              Search a technology or skill to discover developers,
              related capabilities and job opportunities connected through
              the graph.
            </p>

            <form className="search-box" onSubmit={handleSearch}>
              <Search size={21} />

              <input
                type="text"
                placeholder="Search a skill, e.g. Java..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
              />

              <button type="submit" disabled={loading}>
                {loading ? (
                  <LoaderCircle className="spin" size={18} />
                ) : (
                  <>
                    Explore
                    <ArrowRight size={17} />
                  </>
                )}
              </button>
            </form>
          </div>

        </section>

        {/* Popular Skills */}
        <section className="section">
          <div className="section-heading">
            <div>
              <h3>Popular skills</h3>
              <p>Start exploring the most connected technologies.</p>
            </div>
          </div>

          <div className="skill-search">
            <div className="search-icon">
              <Search size={17} />
            </div>

            <input
              type="text"
              placeholder="Search for a skill..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />

            {searchTerm && (
              <button
                className="search-clear"
                onClick={() => setSearchTerm("")}
              >
                <X size={15} />
              </button>
            )}
          </div>

          <div className="skill-pills">
            {filteredSkills.map((skill) => (
              <button
                key={skill}
                className="skill-pill"
                onClick={() => selectPopularSkill(skill)}
              >
                {skill}
                <ArrowRight size={15} />
              </button>
            ))}
          </div>

          {searchTerm && filteredSkills.length === 0 && (
            <div className="search-empty">
              No matching skills found.
            </div>
          )}
        </section>

        {/* Error */}
        {error && (
          <section className="error-card">
            <AlertCircle size={21} />
            <div>
              <strong>Something went wrong</strong>
              <p>{error}</p>
            </div>
          </section>
        )}

        {/* Skill Results */}
        {skillData && !loading && (
          <section className="results">

            <div className="result-header">
              <div>
                <span className="result-label">SKILL</span>
                <h2>{skillData.skill}</h2>
              </div>

              <button
                className="graph-button"
                onClick={() => setShowGraph(true)}
              >
                <GitBranch size={16} />
                Explore Graph
              </button>
            </div>

            {/* Stats */}
            <div className="stats-grid">

              <div className="stat-card">
                <div className="stat-icon">
                  <Users size={20} />
                </div>

                <div>
                  <strong>
                    {skillData.developers?.length || 0}
                  </strong>
                  <span>Developers</span>
                </div>
              </div>

              <div className="stat-card">
                <div className="stat-icon">
                  <GitBranch size={20} />
                </div>

                <div>
                  <strong>
                    {skillData.relatedSkills?.length || 0}
                  </strong>
                  <span>Related Skills</span>
                </div>
              </div>

              <div className="stat-card">
                <div className="stat-icon">
                  <BriefcaseBusiness size={20} />
                </div>

                <div>
                  <strong>
                    {skillData.jobRoles?.length || 0}
                  </strong>
                  <span>Job Roles</span>
                </div>
              </div>

            </div>

            {/* Developers */}
            <div className="content-grid">

              <div className="panel">
                <div className="panel-header">
                  <div>
                    <h3>Developers</h3>
                    <p>People connected to this skill</p>
                  </div>

                  <Users size={20} />
                </div>

                <div className="developer-list">
                  {skillData.developers?.length > 0 ? (
                    skillData.developers.map((developer) => (
                      <div
                        className="developer-card"
                        key={developer.name}
                      >
                        <div className="avatar">
                          {developer.name
                            ?.charAt(0)
                            .toUpperCase()}
                        </div>

                        <div className="developer-info">
                          <strong>{developer.name}</strong>

                          <span>
                            <MapPin size={14} />
                            {developer.location || "Unknown"}
                          </span>
                        </div>

                        <div className="experience">
                          {developer.experienceYears} yrs
                        </div>
                      </div>
                    ))
                  ) : (
                    <div className="empty-state">
                      No developers found.
                    </div>
                  )}
                </div>
              </div>

              {/* Related Skills */}
              <div className="panel">
                <div className="panel-header">
                  <div>
                    <h3>Related skills</h3>
                    <p>Skills connected through the graph</p>
                  </div>

                  <GitBranch size={20} />
                </div>

                <div className="related-list">
                  {skillData.relatedSkills?.length > 0 ? (
                    skillData.relatedSkills.map((skill) => (
                      <button
                        className="related-item"
                        key={skill}
                        onClick={() => selectPopularSkill(skill)}
                      >
                        <span>{skill}</span>
                        <ArrowRight size={17} />
                      </button>
                    ))
                  ) : (
                    <div className="empty-state">
                      No related skills found.
                    </div>
                  )}
                </div>
              </div>

            </div>

            {/* Job Roles */}
            <div className="panel role-panel">

              <div className="panel-header">
                <div>
                  <h3>Job opportunities</h3>
                  <p>
                    Roles requiring this skill
                  </p>
                </div>

                <BriefcaseBusiness size={20} />
              </div>

              <div className="role-list">
                {skillData.jobRoles?.length > 0 ? (
                  skillData.jobRoles.map((role) => (
                    <button
                      className={`role-card ${
                        selectedRole === role ? "active" : ""
                      }`}
                      key={role}
                      onClick={() => loadRecommendations(role)}
                    >
                      <div>
                        <strong>{role}</strong>
                        <span>
                          Find matching developers
                        </span>
                      </div>

                      <ArrowRight size={18} />
                    </button>
                  ))
                ) : (
                  <div className="empty-state">
                    No job roles found.
                  </div>
                )}
              </div>

            </div>

          </section>
        )}

        {/* Recommendations */}
        {selectedRole && (
          <section className="recommendations">

            <div className="section-heading">
              <div>
                <span className="result-label">
                  RECOMMENDATIONS
                </span>

                <h2>{selectedRole}</h2>

                <p>
                  Developers ranked by matching required skills.
                </p>
              </div>

              {roleLoading && (
                <LoaderCircle
                  className="spin"
                  size={24}
                />
              )}
            </div>

            {!roleLoading && recommendations.length === 0 ? (
              <div className="empty-large">
                <Users size={30} />
                <h3>No matching developers</h3>
                <p>
                  We couldn't find developers matching this role.
                </p>
              </div>
            ) : (
              <div className="recommendation-list">
                {recommendations.map((developer, index) => (
                  <div
                    className="recommendation-card"
                    key={developer.developer}
                  >
                    <div className="rank">
                      #{index + 1}
                    </div>

                    <div className="recommendation-main">
                      <strong>{developer.developer}</strong>

                      <div className="matching-skills">
                        {developer.matchingSkills?.map((skill) => (
                          <span key={skill}>{skill}</span>
                        ))}
                      </div>
                    </div>

                    <div className="match-score">
                      <strong>
                        {developer.matchCount}
                      </strong>

                      <span>
                        matching skills
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            )}

          </section>
        )}

      </main>

      {/* Footer */}
      <footer>
<<<<<<< HEAD
        <span>SkillGraph developed by Chandru S</span>
=======
        <span>SkillGraph Developed by Chandru S</span>
>>>>>>> 5d51849 (Merge remote main)
        <span>Powered by CognoDB + Spring Boot + React</span>
      </footer>

      {showGraph && selectedSkill && (
        <GraphExplorer
          skill={selectedSkill}
          onClose={() => setShowGraph(false)}
        />
      )}

    </div>
  );
}

export default App;
