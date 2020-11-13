import Model from "./model.js";
import pool from "../config/database.js";

const Query = {
  GET_QUERY: (milestone_id) =>
    `SELECT i.status FROM issues as i, milestones as m WHERE i.milestone_id = m.milestone_id AND i.milestone_id = ${milestone_id}`,
  POST_QUERY: ({ milestone_id }) =>
    `UPDATE issues SET milestone_id = ${milestone_id}, updated_at = now() WHERE issue_id = `,
  DELETE_QUERY: `UPDATE issues SET milestone_id = NULL, updated_at = now() WHERE issue_id = `,
};

class issueMileStonesModel extends Model {
  constructor(Query) {
    super(Query);
  }
  get = async (ID) => {
    const conn = await pool.getConnection(async (conn) => conn);
    try {
      await conn.beginTransaction();
      const res = await conn.query(this.GET_QUERY(ID));
      const status = {
        opened: 0,
        closed: 0,
      };
      res[0].forEach((res) => {
        if (res.status) status.opened += 1;
        else status.closed += 1;
      });
      return status;
    } catch (error) {
      conn.rollback();
      console.error(error);
    } finally {
      conn.release();
    }
  };
  post = async (PUT_DATA, ID) => {
    const conn = await pool.getConnection(async (conn) => conn);
    try {
      await conn.beginTransaction();
      await conn.query(this.POST_QUERY(PUT_DATA) + ID);
      await conn.commit();
    } catch (error) {
      conn.rollback();
      console.error(error);
    } finally {
      conn.release();
    }
  };

  delete = async (ID) => {
    const conn = await pool.getConnection(async (conn) => conn);
    try {
      await conn.beginTransaction();
      await conn.query(this.DELETE_QUERY + ID);
      await conn.commit();
    } catch (error) {
      conn.rollback();
      console.error(error);
    } finally {
      conn.release();
    }
  };
}

export default new issueMileStonesModel(Query);
