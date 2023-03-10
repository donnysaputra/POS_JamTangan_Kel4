const express = require("express");
const app = express();
app.use(express.json());
const dotenv = require("dotenv");
dotenv.config();
const mysql = require("mysql2");
const cors = require("cors");
const {
  authRoutes,
  productRoutes,
  brandRoutes,
  genderRoutes,
  transRoutes,
} = require("./routes");
app.use(cors());
const options = {
  origin: "http://localhost:3000",
};
app.use(cors(options));

const db = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",

  password: "doni12345",
  database: "project_pos",
});

db.connect((err) => {
  if (err) {
    console.log(err);
  } else {
    console.log("db connected");
  }
});

app.use("/auth", authRoutes);
app.use("/transaction", transRoutes);

app.get("/product-men", (req, res) => {
  const qString = "Select * from products where gender = 1";
  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/full-transaction", (req, res) => {
  const qString =
    "Select n.id, n.qty,n.harga, " +
    "n.product_id,n.trans_header_id,n.no_trans,n.tgl," +
    "n.total,n.user_id,p.brand_id,p.name,p.harga,p.gender,p.stock,p.stock_update from products p join" +
    "(Select i.id, i.qty,i.harga," +
    "i.product_id,i.trans_header_id,h.no_trans,h.tgl," +
    "h.total,h.user_id from trans_items i join " +
    "trans_headers h on i.trans_header_id = h.id)" +
    " n on n.product_id=p.id order by no_trans asc";

  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/transaction", (req, res) => {
  const qString =
    "Select no_trans,total,DATE_FORMAT(tgl, '%d/%m/%Y') as tgl from trans_headers;";

  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});
app.get("/transaction-chart", (req, res) => {
  const qString =
    "Select DATE_FORMAT(tgl, '%d/%m/%Y') as tgl,no_trans,total from trans_headers where DATE_FORMAT(tgl, '%d/%m/%Y') GROUP BY tgl ORDER BY tgl ASC";

  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/transaction-bar", (req, res) => {
  const qString =
    "SELECT b.name,n.jumlah from brands b join (SELECT p.brand_id,sum(qty) as jumlah FROM trans_items i join products p on p.id=i.product_id group by brand_id) n on n.brand_id=b.id order by name asc";

  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/transaction-item", (req, res) => {
  const qString =
    "Select i.qty,i.harga,p.name from trans_items i join products p on i.product_id=p.id order by i.qty desc;";

  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/product-all", (req, res) => {
  const offset = req.query.page ? req.query.page : 0;
  console.log(offset);
  const qString =
    "Select p.id, p.name, p.stock,p.harga,p.image_url,b.name as category, p.gender, p.stock_update from products p join brands b on p.brand_id=b.id where stock > 0 limit 6 offset " +
    offset;
  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});
app.get("/product-all-edit", (req, res) => {
  const qString =
    "Select p.id, p.name, p.stock,p.harga,p.image_url,b.name as category, p.gender, p.stock_update from products p join brands b on p.brand_id=b.id";
  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});
app.get("/products/:id", (req, res) => {
  // console.log(req.params);
  const qString =
    "Select p.id, p.name,p.brand_id, p.stock,p.harga,p.image_url,b.name as category, p.gender, p.stock_update from products p join brands b on p.brand_id=b.id where p.id =" +
    req.params.id;
  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result[0],
    });
  });
});
app.get("/category", (req, res) => {
  const qString = "select name from brands order by name asc";
  db.query(qString, (err, result) => {
    if (err) {
      res.status(400).json({
        message: "query error",
      });
    }
    +res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.patch("/edit-product", (req, res) => {
  // console.log(req.query.id);
  // console.log(req.body);
  const qString = `update products set name ="${req.body.name}"  ,harga=${req.body.harga},stock=${req.body.stock},brand_id=${req.body.brand_id}, gender="${req.body.gender}" where id=${req.query.id}`;
  db.query(qString, (err, result) => {
    if (err) {
      console.log(err);
      res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.delete("/delete-product", (req, res) => {
  // console.log(req.query.id);
  // console.log(req.body);
  const qString = `delete from products where id=${req.query.id}`;
  db.query(qString, (err, result) => {
    if (err) {
      return res.status(400).json({
        message: "query error",
      });
    }
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/filter-edit", (req, res) => {
  // console.log(req.query);
  const { order } = req.query;
  delete req.query.order;
  const arrQuery = Object.entries(req.query);

  let gender = arrQuery.filter((val) => {
    return val[0] === "men" || val[0] === "women" || val[0] === "unisex";
  });

  // console.log(gender);

  const categories = arrQuery.filter((val) => {
    return val[0] !== "men" && val[0] !== "women" && val[0] !== "unisex";
  });

  // console.log(categories);

  let where = "";

  /// start
  if (gender.length || categories.length) {
    where = " where (";

    if (gender.length) {
      gender = gender.filter((val) => {
        return val != undefined;
      });

      gender.map((val, idx) => {
        if (idx) {
          if (val) {
            where += `or n.gender = '${val[0]}' `;
          }
        } else {
          if (val) {
            where += ` n.gender = '${val[0]}' `;
          }
        }
      });
    }

    if (categories.length) {
      if (gender.length) {
        where += ") and (";
      }
      // console.log(categories);
      categories.map((val, idx) => {
        idx
          ? (where += `or n.category = '${val[0]}' `)
          : (where += ` n.category = '${val[0]}' `);
      });
    }

    where += ")";
  }

  ///end

  qString =
    "Select * from (Select p.name, p.stock,p.harga,p.image_url,b.name as category, p.gender, p.stock_update from products p join brands b on p.brand_id=b.id) as n " +
    where +
    " order by name " +
    order;

  db.query(qString, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(400).json({
        message: "query error",
      });
    }

    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});
app.get("/filter", (req, res) => {
  console.log(req.query);
  const { order } = req.query;
  delete req.query.order;
  const arrQuery = Object.entries(req.query);

  let gender = arrQuery.filter((val) => {
    return val[0] === "men" || val[0] === "women" || val[0] === "unisex";
  });

  console.log(gender);

  const categories = arrQuery.filter((val) => {
    return val[0] !== "men" && val[0] !== "women" && val[0] !== "unisex";
  });

  console.log(categories);

  let where = " WHERE  stock > 0 ";

  /// start
  if (gender.length || categories.length) {
    where = " and (";

    if (gender.length) {
      gender = gender.filter((val) => {
        return val != undefined;
      });

      gender.map((val, idx) => {
        if (idx) {
          if (val) {
            where += `or n.gender = '${val[0]}' `;
          }
        } else {
          if (val) {
            where += ` n.gender = '${val[0]}' `;
          }
        }
      });
    }

    if (categories.length) {
      if (gender.length) {
        where += ") and (";
      }
      console.log(categories);
      categories.map((val, idx) => {
        idx
          ? (where += `or n.category = '${val[0]}' `)
          : (where += ` n.category = '${val[0]}' `);
      });
    }

    where += ")";
  }

  ///end

  qString =
    "Select * from (Select p.name, p.stock,p.harga,p.image_url,b.name as category, p.gender, p.stock_update from products p join brands b on p.brand_id=b.id) as n " +
    where +
    "order by name " +
    order;

  db.query(qString, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(400).json({
        message: "query error",
      });
    }

    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});
app.get("/find", (req, res) => {
  console.log(req.query);
  let qString = "Select * from products ";

  qString = qString + " where name LIKE '%" + req.query.name + "%' ";

  console.log(qString);
  db.query(qString, (err, result) => {
    if (err) {
      return res.status(400).json({
        message: "query error",
      });
    }

    console.log(res.data);
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/fildate", (req, res) => {
  console.log(req.query);
  let qString =
    "Select DATE_FORMAT(tgl, '%d/%m/%Y') as tgl,no_trans,total from trans_headers where tgl BETWEEN '" +
    req.query.datefrom +
    "' AND '" +
    req.query.dateend +
    "'";

  console.log(qString);
  db.query(qString, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(400).json({
        message: "query error",
      });
    }

    console.log(res.data);
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

app.get("/fildatepro", (req, res) => {
  console.log(req.query);
  let qString =
    "select * from trans_headers h join (Select i.qty,i.harga,i.trans_header_id,p.name from trans_items i join products p on i.product_id=p.id) n on n.trans_header_id=h.id  where h.tgl BETWEEN '" +
    req.query.datefrom +
    "' AND '" +
    req.query.dateend +
    "'";

  console.log(qString);
  db.query(qString, (err, result) => {
    if (err) {
      console.log(err);
      return res.status(400).json({
        message: "query error",
      });
    }

    console.log(res.data);
    res.status(200).json({
      message: "data fetched",
      result: result,
    });
  });
});

// app.get("/date", (req, res) => {
//   console.log(req.query);
//   let qString = "Select * from products ";

//   qString = qString + " where name LIKE '%" + req.query.name + "%' ";

//   console.log(qString);
//   db.query(qString, (err, result) => {
//     if (err) {
//       return res.status(400).json({
//         message: "query error",
//       });
//     }

//     console.log(res.data);
//     res.status(200).json({
//       message: "data fetched",
//       result: result,
//     });
//   });
// });

app.listen(2000, () => {
  console.log("api is running");
});

app.use("/auth", authRoutes);
app.use("/product", productRoutes);
app.use("/gender", genderRoutes);
app.use("/brand", brandRoutes);
app.use("/transaction1", transRoutes);
app.use("/post_image", express.static(`${__dirname}/public/IMAGE_PRODUCT`));
