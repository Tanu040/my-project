import { useState } from "react";

function App() {
  // Initial orders
  const [orders, setOrders] = useState([
    { id: 1, product: "Laptop", status: "Shipped" },
    { id: 2, product: "Phone", status: "Pending" },
  ]);

  // Form inputs
  const [id, setId] = useState("");
  const [product, setProduct] = useState("");
  const [status, setStatus] = useState("");

  // Function to add a new order
  const addOrder = () => {
    if (!id || !product || !status) {
      alert("Please fill all fields");
      return;
    }

    setOrders([...orders, { id: Number(id), product, status }]);

    // Clear inputs
    setId("");
    setProduct("");
    setStatus("");
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>Orders List</h1>
      <ul>
        {orders.map((order) => (
          <li key={order.id}>
            <strong>ID:</strong> {order.id}, <strong>Product:</strong>{" "}
            {order.product}, <strong>Status:</strong> {order.status}
          </li>
        ))}
      </ul>

      <h2>Add New Order</h2>
      <div style={{ marginBottom: "10px" }}>
        <input
          type="number"
          placeholder="ID"
          value={id}
          onChange={(e) => setId(e.target.value)}
          style={{ marginRight: "5px" }}
        />
        <input
          type="text"
          placeholder="Product"
          value={product}
          onChange={(e) => setProduct(e.target.value)}
          style={{ marginRight: "5px" }}
        />
        <input
          type="text"
          placeholder="Status"
          value={status}
          onChange={(e) => setStatus(e.target.value)}
          style={{ marginRight: "5px" }}
        />
        <button onClick={addOrder}>Add Order</button>
      </div>
    </div>
  );
}

export default App;


