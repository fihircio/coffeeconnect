import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const navItems = [
  { name: 'Dashboard', path: '/' },
  { name: 'Orders', path: '/orders' },
  { name: 'Menu', path: '/menu' },
  { name: 'Promotions', path: '/promotions' },
  { name: 'Analytics', path: '/analytics' },
  { name: 'Customers', path: '/customers' },
  { name: 'Settings', path: '/settings' },
];

export default function Sidebar() {
  const location = useLocation();
  return (
    <aside className="h-screen w-56 bg-[#f5efe6] border-r border-gray-200 flex flex-col py-6 px-4">
      <div className="mb-8 text-2xl font-extrabold text-[#7c4a1a] tracking-tight">☕ CoffeeConnect</div>
      <nav className="flex-1 flex flex-col gap-2">
        {navItems.map(item => (
          <Link
            key={item.path}
            to={item.path}
            className={`rounded-lg px-4 py-2 text-lg font-medium transition-colors ${location.pathname === item.path ? 'bg-[#e3d5ca] text-[#7c4a1a]' : 'text-gray-700 hover:bg-[#e3d5ca]'}`}
          >
            {item.name}
          </Link>
        ))}
      </nav>
    </aside>
  );
}
