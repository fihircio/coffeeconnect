# CoffeeConnect Merchant Dashboard (Web Admin)

## Overview
The CoffeeConnect Merchant Dashboard is a web-based admin panel for coffee shop owners and staff to manage orders, menu, promotions, loyalty programs, customer insights, analytics, and platform settings. The platform supports multi-tenant, white-label SaaS for scalable deployment across multiple merchants.

## Key Features
- **Login / Dashboard**: Secure login for merchants/admins. Dashboard with today's sales, live orders, and top items.
- **Live Orders Queue**: View and manage current orders (ID, items, timestamp, status). Actions: Mark as ready, Cancel.
- **Menu Manager**: Add, edit, delete menu items. Toggle price and availability.
- **Promotions & Loyalty**: Add promo codes, define loyalty rules (e.g., 1 point = RM1 or custom per merchant), view campaign analytics.
- **Customer Insights**: See frequent customers, top preferences, and feedback summary.
- **Analytics & Reports**: 
  - User behavior metrics (peak hours, preferred drinks, order frequency, device, referral source)
  - Order & sales data (top-selling items, sales by hour/day, average order value, payment method, failed/canceled orders)
  - Location/contextual data (geolocation, weather, events)
  - Customer segmentation (lifetime value, new vs returning, churn, referrals)
  - Operational insights (prep time, inventory, queue time, staff schedule)
  - Advanced analytics (churn prediction, loyalty usage, promo effectiveness, smart insights)
- **Settings**: Manage store hours, payment settings, notification preferences, and merchant-level branding.
- **Staff & Outlet Management**: Manage staff roles, permissions, and multiple outlets per merchant.
- **White-label SaaS & Multi-Tenancy**: Each merchant gets their own branded portal (logo, theme, custom menu, loyalty rules). Merchants can manage their own payment gateway integration and staff. Subscription tiers unlock advanced features (analytics, outlets, custom branding).
- **Subscription & Billing**: Admin dashboard for managing merchant subscriptions, billing, and feature access. Auto-suspend merchants on non-payment.

## Design Direction
- **Color palette**: Soft cream & coffee tones, sage green, burnt orange accents
- **Typography**: Sans-serif (Inter, SF Pro), subtle weight variation
- **Components**: Rounded cards, soft shadows, minimalistic icons

## Expansion Opportunities
- POS integration, kiosk/QR ordering, marketing automation, analytics as a service, BYOC loyalty, reseller plans, mobile white-label app per brand.

## Next Steps
1. ERD (Entity Relationship Diagram) for backend data structure (with analytics, multi-tenancy, and SaaS support)
2. API endpoints planning (including merchant customization, subscription, and staff management)
3. UI wireframes and component breakdown
4. Implementation (frontend & backend)
