const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const uuid = require("uuid").v4;

const app = express();
const port = 3000;

app.use(bodyParser.json({ limit: "50mb" }));
app.use(cors({ origin: "*" }));

const tasks = [];

app.get("/", (_, res) => res.send("Hello world!"));

app.get("/tasks", (_, res) => {
  console.log("Fetching tasks");
  const sortedTasks = [...tasks].sort(taskSort);
  res.status(200).send({
    tasks,
  });
});

app.post("/tasks", async (req, res) => {
  await new Promise(resolve => setTimeout(() => resolve(), 1000));
  console.log("Creating a new task");
  console.log(req.body);
  const task = {
    ...req.body,
    id: uuid(),
    timestamp: Date.now(),
  };

  tasks.push(task);
  res.status(200).send(task);
});

app.delete("/tasks/:id", async (req, res) => {
  await new Promise(resolve => setTimeout(() => resolve(), 1000));
  const id = req.params.id;
  console.log(`Attempting to remove task ${id}`);
  const taskIndex = tasks.findIndex((t) => t.id === id);
  if (taskIndex !== -1) {
    tasks.splice(taskIndex, 1);
    res.status(200).send({ id });
  } else {
    res.status(404).send("Not found");
  }
});

app.put("/tasks/:id", async (req, res) => {
  await new Promise(resolve => setTimeout(() => resolve(), 1000));
  const id = req.params.id;
  console.log(`Attempting to update task ${id}`);
  const taskIndex = tasks.findIndex((t) => t.id === id);
  if (taskIndex !== -1) {
    const task = {
      ...tasks[taskIndex],
      ...req.body,
      // Ensure id remains unchanged
      id,
    };
    tasks.splice(taskIndex, 1);
    tasks.push(task);
    res.status(200).send(task);
  } else {
    res.status(404).send("Not found");
  }
});

app.listen(port, () =>
  console.log(`Todoey API listening on http://localhost:${port}`)
);

function taskSort(a, b) {
  // Undone tasks should go first
  if (!a.isDone && b.isDone) {
    return -1;
  } else if (a.isDone && !b.isDone) {
    return 1;
  } else {
    // If both tasks share the same state, they are ordered using the timestamp
    return a.timestamp - b.timestamp;
  }
}
