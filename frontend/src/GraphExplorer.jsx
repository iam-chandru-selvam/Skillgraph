import { useEffect, useRef, useState } from "react";
import ForceGraph2D from "react-force-graph-2d";
import { X, LoaderCircle } from "lucide-react";

import { getSkillGraph } from "./api";

function GraphExplorer({ skill, onClose }) {
  const graphRef = useRef();

  const [graphData, setGraphData] = useState({
    nodes: [],
    links: [],
  });

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [selectedNode, setSelectedNode] = useState(null);

  const loadGraph = async () => {
    setLoading(true);
    setError("");

    try {
      const data = await getSkillGraph(skill);

      setGraphData({
        nodes: data.nodes || [],
        links: data.links || [],
      });
    } catch (err) {
      console.error(err);
      setError(
        err.message || "Unable to connect to the graph database."
      );
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadGraph();
  }, [skill]);

  const getNodeColor = (type) => {
    switch (type) {
      case "Developer":
        return "#60a5fa";

      case "Skill":
        return "#a78bfa";

      case "JobRole":
        return "#34d399";

      default:
        return "#9ca3af";
    }
  };

  const handleNodeClick = (node) => {
    setSelectedNode(node);

    if (!graphRef.current) {
      return;
    }

    graphRef.current.centerAt(node.x, node.y, 800);
    graphRef.current.zoom(3, 800);
  };

const connectedLinks = selectedNode
  ? graphData.links.filter(
      (link) =>
        link.source?.id === selectedNode.id ||
        link.target?.id === selectedNode.id ||
        link.source === selectedNode.id ||
        link.target === selectedNode.id
    )
  : [];

  const developerCount = graphData.nodes.filter(
    (node) => node.type === "Developer"
  ).length;

  const skillCount = graphData.nodes.filter(
    (node) => node.type === "Skill"
  ).length;

  const roleCount = graphData.nodes.filter(
    (node) => node.type === "JobRole"
  ).length;

  const relationshipCount = graphData.links.length;

  return (
    <div className="graph-overlay">

      <div className="graph-modal">

        <div className="graph-header">

          <div>
            <span className="result-label">
              GRAPH EXPLORER
            </span>

            <h2>{skill}</h2>

            <p>
              Explore connected developers, skills and job roles.
            </p>
          </div>

          <button
            className="graph-close"
            onClick={onClose}
          >
            <X size={20} />
          </button>

        </div>

        <div className="graph-stats">

          <div className="graph-stat">
            <strong>{developerCount}</strong>
            <span>Developers</span>
          </div>

          <div className="graph-stat">
            <strong>{skillCount}</strong>
            <span>Skills</span>
          </div>

          <div className="graph-stat">
            <strong>{roleCount}</strong>
            <span>Job Roles</span>
          </div>

          <div className="graph-stat">
            <strong>{relationshipCount}</strong>
            <span>Connections</span>
          </div>

        </div>

        <div className="graph-content">

          {loading && (
            <div className="graph-state">
              <LoaderCircle
                className="spin"
                size={32}
              />

              <p>Loading graph...</p>
            </div>
          )}

          {error && !loading && (
            <div className="graph-error">

              <div className="error-icon">
                ⚠
              </div>

              <h3>
                Unable to load graph data
              </h3>

              <p>
                {error}
              </p>

              <button
                className="retry-button"
                onClick={loadGraph}
              >
                Try Again
              </button>

            </div>
          )}

          {!loading && !error && graphData.nodes.length === 0 && (
            <div className="graph-state">
              <p>No graph data found.</p>
            </div>
          )}

          {!loading && !error && graphData.nodes.length > 0 && (
            <ForceGraph2D
              ref={graphRef}
              graphData={graphData}

              backgroundColor="#08090d"

              nodeLabel={(node) =>
                `${node.type}: ${node.label}`
              }

              nodeColor={(node) =>
                getNodeColor(node.type)
              }

              nodeRelSize={5}

              linkColor={() => "#3b3d4a"}

              linkWidth={1.5}

              linkDirectionalArrowLength={5}

              linkDirectionalArrowRelPos={1}

              linkLabel={(link) => link.label}

              onNodeClick={handleNodeClick}

              linkCanvasObject={(link, ctx, globalScale) => {
                const source =
                  typeof link.source === "object"
                    ? link.source
                    : null;

                const target =
                  typeof link.target === "object"
                    ? link.target
                    : null;

                if (!source || !target) {
                  return;
                }

                const label = link.label;

                const fontSize = Math.max(8 / globalScale, 2);

                ctx.font = `${fontSize}px Inter, sans-serif`;
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";

                const x = (source.x + target.x) / 2;
                const y = (source.y + target.y) / 2;

                ctx.fillStyle = "#777a87";

                ctx.fillText(
                  label,
                  x,
                  y
                );
              }}



              nodeCanvasObject={(node, ctx, globalScale) => {

                const label = node.label;

                const fontSize =
                  Math.max(10 / globalScale, 2.5);

                ctx.font =
                  `${fontSize}px Inter, sans-serif`;

                ctx.textAlign = "center";
                ctx.textBaseline = "middle";

                ctx.beginPath();

                ctx.arc(
                  node.x,
                  node.y,
                  7,
                  0,
                  2 * Math.PI
                );

                ctx.fillStyle =
                  getNodeColor(node.type);

                ctx.fill();

                ctx.fillStyle = "#f4f4f5";

                ctx.fillText(
                  label,
                  node.x,
                  node.y + 14
                );
              }}
            />

            )}

            {selectedNode && (
              <div className="node-inspector">

                <div className="inspector-header">

                  <div>
                    <span className="result-label">
                      NODE DETAILS
                    </span>

                    <h3>{selectedNode.label}</h3>

                    <span className="node-type">
                      {selectedNode.type}
                    </span>
                  </div>

                  <button
                    className="inspector-close"
                    onClick={() => setSelectedNode(null)}
                  >
                    <X size={16} />
                  </button>

                </div>

                <div className="inspector-section">

                  <span className="inspector-title">
                    Connections
                  </span>

                  {connectedLinks.length === 0 ? (
                    <p className="inspector-empty">
                      No connections found.
                    </p>
                  ) : (
                    <div className="connection-list">

                      {connectedLinks.map((link, index) => {

                        const source =
                          typeof link.source === "object"
                            ? link.source
                            : graphData.nodes.find(
                                (node) => node.id === link.source
                              );

                        const target =
                          typeof link.target === "object"
                            ? link.target
                            : graphData.nodes.find(
                                (node) => node.id === link.target
                              );

                        const otherNode =
                          source?.id === selectedNode.id
                            ? target
                            : source;

                        return (
                          <div
                            className="connection-item"
                            key={`${link.label}-${index}`}
                          >

                            <div className="connection-node">
                              {otherNode?.label}
                            </div>

                            <div className="connection-type">
                              {link.label}
                            </div>

                          </div>
                        );
                      })}

                    </div>
                  )}

                </div>

              </div>
            )}



        </div>

        <div className="graph-legend">

          <div>
            <span
              className="legend-dot developer"
            />
            Developer
          </div>

          <div>
            <span
              className="legend-dot skill"
            />
            Skill
          </div>

          <div>
            <span
              className="legend-dot role"
            />
            Job Role
          </div>

          <div className="graph-hint">
            Drag nodes • Scroll to zoom • Click a node to focus
          </div>

        </div>

      </div>

    </div>
  );
}

export default GraphExplorer;
