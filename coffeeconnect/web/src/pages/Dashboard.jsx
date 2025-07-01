import React from 'react';

const summaryCards = [
	{
		title: "Today's Sales",
		value: 'RM 1,250.00',
		color: 'bg-[#ffe5b4]',
		icon: '💰',
	},
	{
		title: 'Live Orders',
		value: '7',
		color: 'bg-[#b7e4c7]',
		icon: '🕒',
	},
	{
		title: 'Top Item',
		value: 'Iced Latte',
		color: 'bg-[#ffd6d6]',
		icon: '🥤',
	},
];

const recentOrders = [
	{ id: 'ORD-1001', item: 'Iced Latte', status: 'Preparing', time: '09:12' },
	{ id: 'ORD-1002', item: 'Flat White', status: 'Ready', time: '09:10' },
	{ id: 'ORD-1003', item: 'Americano', status: 'Picked up', time: '09:05' },
	{ id: 'ORD-1004', item: 'Matcha Latte', status: 'Preparing', time: '09:02' },
];

export default function Dashboard() {
	return (
		<div className="max-w-6xl mx-auto space-y-10">
			<div className="grid grid-cols-1 md:grid-cols-3 gap-8">
				{summaryCards.map(card => (
					<div key={card.title} className={`rounded-xl shadow p-6 flex items-center gap-4 ${card.color}`}>
						<span className="text-4xl">{card.icon}</span>
						<div>
							<div className="text-lg font-semibold text-gray-700">{card.title}</div>
							<div className="text-2xl font-bold text-[#7c4a1a]">{card.value}</div>
						</div>
					</div>
				))}
			</div>
			<div>
				<div className="text-xl font-bold mb-4 text-[#7c4a1a]">Recent Orders</div>
				<div className="bg-white rounded-xl shadow divide-y">
					{recentOrders.map(order => (
						<div key={order.id} className="flex items-center justify-between px-6 py-4">
							<div className="font-medium text-gray-800">{order.id}</div>
							<div className="text-gray-600">{order.item}</div>
							<div className={`px-3 py-1 rounded-full text-sm font-semibold ${order.status === 'Preparing' ? 'bg-yellow-100 text-yellow-800' : order.status === 'Ready' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-700'}`}>{order.status}</div>
							<div className="text-gray-400">{order.time}</div>
						</div>
					))}
				</div>
			</div>
		</div>
	);
}
