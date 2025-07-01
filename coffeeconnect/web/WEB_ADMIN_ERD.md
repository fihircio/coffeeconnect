# CoffeeConnect Merchant Dashboard ERD

## Entities & Relationships

### 1. User (Merchant/Admin)
- id (PK)
- name
- email
- password_hash
- role (admin/merchant)
- phone
- created_at

### 2. Store
- id (PK)
- name
- address
- phone
- open_hours
- status (open/closed)
- owner_id (FK → User.id)

### 3. MenuItem
- id (PK)
- store_id (FK → Store.id)
- name
- description
- category (Coffee, Tea, Snack, etc.)
- price
- image_url
- available (bool)

### 4. Order
- id (PK)
- store_id (FK → Store.id)
- customer_id (FK → Customer.id)
- status (pending, preparing, ready, picked_up, cancelled)
- order_type (pickup/delivery)
- total_price
- loyalty_points_redeemed
- created_at

### 5. OrderItem
- id (PK)
- order_id (FK → Order.id)
- menu_item_id (FK → MenuItem.id)
- quantity
- customizations (json)
- price

### 6. Promotion
- id (PK)
- store_id (FK → Store.id)
- code
- description
- discount_type (percent/fixed)
- discount_value
- start_date
- end_date
- active (bool)

### 7. LoyaltyRule
- id (PK)
- store_id (FK → Store.id)
- points_per_currency
- min_redeem_points
- active (bool)

### 8. Customer
- id (PK)
- name
- phone
- email
- created_at

### 9. LoyaltyPoint
- id (PK)
- customer_id (FK → Customer.id)
- store_id (FK → Store.id)
- points_balance
- last_updated

### 10. Feedback
- id (PK)
- order_id (FK → Order.id)
- customer_id (FK → Customer.id)
- rating (1-5)
- comment
- created_at

### 11. AnalyticsEvent
- id (PK)
- store_id (FK → Store.id)
- customer_id (FK → Customer.id, nullable)
- event_type (order_placed, order_canceled, promo_redeemed, feedback_submitted, etc.)
- event_data (json)
- device_type (iOS, Android, Web)
- referral_source (social, QR, Google, etc.)
- timestamp

## Relationships
- User (1) — (M) Store
- Store (1) — (M) MenuItem
- Store (1) — (M) Order
- Store (1) — (M) Promotion
- Store (1) — (M) LoyaltyRule
- Store (1) — (M) AnalyticsEvent
- Customer (1) — (M) Order
- Customer (1) — (M) AnalyticsEvent
- Order (1) — (M) OrderItem
- Customer (1) — (M) LoyaltyPoint
- Order (1) — (1) Feedback

---

> This ERD now supports advanced analytics and reporting, including user behavior, sales, operational, and segmentation metrics for the admin dashboard.

## Next Steps
- API endpoint planning (including analytics endpoints)
- UI wireframes/components
- Implementation
