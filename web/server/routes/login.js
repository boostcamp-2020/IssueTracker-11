import express from "express";
import github from "../middlewares/github";

const router = express.Router();

router.get("/", (req, res, next) => {
  github.get("/github");
});

export default router;
