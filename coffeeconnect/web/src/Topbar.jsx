import React from 'react';

export default function Topbar() {
  return (
    <header className="h-16 w-full flex items-center justify-between px-8 bg-white border-b border-gray-200 shadow-sm">
      <div className="text-xl font-semibold text-[#7c4a1a]">Merchant Dashboard</div>
      <div className="flex items-center gap-4">
        <span className="text-gray-600 font-medium">Hi, Admin</span>
        <img src="/vite.svg" alt="Profile" className="w-8 h-8 rounded-full border border-gray-300" />
      </div>
    </header>
  );
}
