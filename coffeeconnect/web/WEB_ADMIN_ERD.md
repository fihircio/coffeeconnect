# CoffeeConnect Merchant Dashboard ERD

## Entities & Relationships

### 1. Merchant
- id (PK)
- name
- branding (json: logo, theme)
- subscription_tier
- payment_config (json)
- created_at

### 2. User (Merchant/Admin)
- id (PK)
- merchant_id (FK → Merchant.id)
- name
- email
- password_hash
- role (admin/merchant)
- phone
- created_at

### 3. Staff
- id (PK)
- merchant_id (FK → Merchant.id)
- name
- role (admin/barista)
- email
- phone

### 4. Outlet (Store)
- id (PK)
- merchant_id (FK → Merchant.id)
- name
- address
- phone
- open_hours
- status (open/closed)
- owner_id (FK → User.id)

### 5. MenuItem
- id (PK)
- store_id (FK → Outlet.id)
- name
- description
- category (Coffee, Tea, Snack, etc.)
- price
- image_url
- available (bool)

### 6. Order
- id (PK)
- store_id (FK → Outlet.id)
- customer_id (FK → Customer.id)
- status (pending, preparing, ready, picked_up, cancelled)
- order_type (pickup/delivery)
- total_price
- loyalty_points_redeemed
- created_at

### 7. OrderItem
- id (PK)
- order_id (FK → Order.id)
- menu_item_id (FK → MenuItem.id)
- quantity
- customizations (json)
- price

### 8. Promotion
- id (PK)
- store_id (FK → Outlet.id)
- code
- description
- discount_type (percent/fixed)
- discount_value
- start_date
- end_date
- active (bool)

### 9. LoyaltyRule
- id (PK)
- store_id (FK → Outlet.id)
- points_per_currency
- min_redeem_points
- active (bool)

### 10. Customer
- id (PK)
- name
- phone
- email
- created_at

### 11. LoyaltyPoint
- id (PK)
- customer_id (FK → Customer.id)
- store_id (FK → Outlet.id)
- points_balance
- last_updated

### 12. Feedback
- id (PK)
- order_id (FK → Order.id)
- customer_id (FK → Customer.id)
- rating (1-5)
- comment
- created_at

### 13. AnalyticsEvent
- id (PK)
- store_id (FK → Outlet.id)
- customer_id (FK → Customer.id, nullable)
- event_type (order_placed, order_canceled, promo_redeemed, feedback_submitted, etc.)
- event_data (json)
- device_type (iOS, Android, Web)
- referral_source (social, QR, Google, etc.)
- timestamp

### 14. Subscription
- id (PK)
- merchant_id (FK → Merchant.id)
- tier
- status
- billing_info (json)
- start_date
- end_date

### 15. PaymentGatewayConfig
- id (PK)
- merchant_id (FK → Merchant.id)
- provider
- config (json)

## Relationships
- Merchant (1) — (M) User
- Merchant (1) — (M) Staff
- Merchant (1) — (M) Outlet
- Merchant (1) — (1) PaymentGatewayConfig
- Merchant (1) — (1) Subscription
- Outlet (1) — (M) MenuItem
- Outlet (1) — (M) Order
- Outlet (1) — (M) Promotion
- Outlet (1) — (M) LoyaltyRule
- Outlet (1) — (M) AnalyticsEvent
- Customer (1) — (M) Order
- Customer (1) — (M) AnalyticsEvent
- Order (1) — (M) OrderItem
- Customer (1) — (M) LoyaltyPoint
- Order (1) — (1) Feedback

---

> This ERD now supports advanced analytics, multi-tenancy, SaaS features, and reporting, including user behavior, sales, operational, and segmentation metrics for the admin dashboard.

## Next Steps
- API endpoint planning (including analytics, merchant customization, subscription, and staff management)
- UI wireframes/components
- Implementation
