# CoffeeConnect Merchant Dashboard API Endpoints

## Authentication
- `POST /api/admin/login` — Admin/merchant login
- `POST /api/admin/logout` — Logout

## Dashboard & Analytics
- `GET /api/admin/dashboard/summary` — Today's sales, live orders, top items
- `GET /api/admin/analytics/overview` — User behavior, sales, operational metrics
- `GET /api/admin/analytics/customers` — Customer segmentation, top users, churn, referrals
- `GET /api/admin/analytics/orders` — Order trends, failed/canceled, payment methods
- `GET /api/admin/analytics/insights` — Smart insights (e.g., upsell, weather impact, churn prediction, promo effectiveness)

## Orders
- `GET /api/admin/orders` — List live/past orders
- `PATCH /api/admin/orders/:id/status` — Update order status (ready, cancel, etc.)

## Menu Management
- `GET /api/admin/menu` — List menu items
- `POST /api/admin/menu` — Add menu item
- `PUT /api/admin/menu/:id` — Edit menu item
- `DELETE /api/admin/menu/:id` — Delete menu item
- `PATCH /api/admin/menu/:id/availability` — Toggle availability

## Promotions & Loyalty
- `GET /api/admin/promotions` — List promotions
- `POST /api/admin/promotions` — Add promo code
- `PUT /api/admin/promotions/:id` — Edit promo
- `DELETE /api/admin/promotions/:id` — Delete promo
- `GET /api/admin/loyalty` — View loyalty rules
- `PUT /api/admin/loyalty` — Update loyalty rules

## Customers & Feedback
- `GET /api/admin/customers` — List customers
- `GET /api/admin/customers/:id` — Customer details, order history
- `GET /api/admin/feedback` — List feedback/reviews

## Settings & Customization
- `GET /api/admin/settings` — Get store/payment/notification settings
- `PUT /api/admin/settings` — Update settings
- `GET /api/admin/branding` — Get merchant branding (logo, theme)
- `PUT /api/admin/branding` — Update branding
- `GET /api/admin/payment-gateway` — Get payment config
- `PUT /api/admin/payment-gateway` — Update payment config

## Subscription & SaaS
- `GET /api/admin/subscription` — Get subscription tier/status
- `PUT /api/admin/subscription` — Update subscription

## Staff & Outlet Management
- `GET /api/admin/staff` — List staff
- `POST /api/admin/staff` — Add staff
- `PUT /api/admin/staff/:id` — Edit staff
- `DELETE /api/admin/staff/:id` — Remove staff
- `GET /api/admin/outlets` — List outlets
- `POST /api/admin/outlets` — Add outlet
- `PUT /api/admin/outlets/:id` — Edit outlet
- `DELETE /api/admin/outlets/:id` — Remove outlet

---

> All endpoints are prefixed with `/api/admin/` for the portal. Analytics endpoints support dashboard metrics and smart reporting. Multi-tenant and SaaS features are supported for white-label deployment.

## Next Steps
- UI wireframes and component breakdown
- Implementation (frontend & backend)
