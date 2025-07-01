import React, { useState } from "react";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Sidebar from "./Sidebar";
import Topbar from "./Topbar";
import "./App.css";

// Placeholder pages
const Dashboard = React.lazy(() => import("./pages/Dashboard"));
const Orders = React.lazy(() => import("./pages/Orders"));
const Menu = React.lazy(() => import("./pages/Menu"));
const Promotions = React.lazy(() => import("./pages/Promotions"));
const Analytics = React.lazy(() => import("./pages/Analytics"));
const Customers = React.lazy(() => import("./pages/Customers"));
const Settings = React.lazy(() => import("./pages/Settings"));

function App() {
  const [count, setCount] = useState(0);

  return (
    <Router>
      <div className="flex h-screen bg-[#f8f6f3]">
        <Sidebar />
        <div className="flex-1 flex flex-col min-w-0">
          <Topbar />
          <main className="flex-1 overflow-y-auto p-6">
            <React.Suspense fallback={<div>Loading...</div>}>
              <Routes>
                <Route path="/" element={<Dashboard />} />
                <Route path="/orders" element={<Orders />} />
                <Route path="/menu" element={<Menu />} />
                <Route path="/promotions" element={<Promotions />} />
                <Route path="/analytics" element={<Analytics />} />
                <Route path="/customers" element={<Customers />} />
                <Route path="/settings" element={<Settings />} />
                <Route path="*" element={<Navigate to="/" replace />} />
              </Routes>
            </React.Suspense>
          </main>
        </div>
      </div>
    </Router>
  );
}

export default App;
