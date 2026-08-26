import axios from "axios";

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL || "http://localhost:8080/api",
  timeout: 10000,
});

export const getSkillDetails = async (skill) => {
  const response = await api.get("/skills", {
    params: { name: skill },
  });
  return response.data;
};

export const getDevelopersBySkill = async (skill) => {
  const response = await api.get("/developers", {
    params: { skill },
  });
  return response.data;
};

export const getRecommendations = async (role) => {
  const response = await api.get("/recommendations", {
    params: { role },
  });
  return response.data;
};

export const getSkillGraph = async (skill) => {
  const response = await api.get("/graph", {
    params: { name: skill },
  });
  return response.data;
};