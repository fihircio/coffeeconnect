# CoffeeConnect Mobile App SRS

## 1. System Overview
CoffeeConnect digitalizes the café experience for users via a mobile app, enabling pre-ordering, loyalty rewards, and real-time notifications.

## 2. Functional Components
| ID         | Module             | Description                                 |
|------------|--------------------|---------------------------------------------|
| SRS-UA-01  | Login/Auth         | OTP or Google/Apple ID authentication       |
| SRS-UA-02  | Menu               | Dynamic, location-based menu                |
| SRS-UA-03  | Order Customization| Add-ons, sugar/milk options                 |
| SRS-UA-04  | Checkout           | Wallet/payment gateway integration          |
| SRS-UA-05  | Loyalty Points     | View, earn, redeem loyalty points           |
| SRS-UA-06  | Order History      | Repeat, track orders                        |
| SRS-UA-07  | Push Notifications | Status & promo alerts                       |

## 3. Technical Requirements
- **Frontend:** Flutter
- **Authentication:** Firebase Auth (OTP/email/Google)
- **Payments:** Stripe, iPay88/eGHL, TnG Wallet
- **Cloud Hosting:** DigitalOcean + Supabase
- **CI/CD:** GitHub Actions

## 4. Data Models (Simplified)
### Users
- `id`, `name`, `phone/email`, `default_store_id`, `loyalty_points`, `preferences (JSON)`

### Orders
- `id`, `user_id`, `store_id`, `status`, `timestamp`, `total_amount`

### Preferences
- `user_id`, `sugar_type`, `milk_type`, `size`, `favorites (JSON)`

## 5. APIs (Sample Endpoints)
| Endpoint         | Method | Description                       |
|------------------|--------|-----------------------------------|
| /login           | POST   | Auth via OTP                      |
| /order/new       | POST   | Submit order                      |
| /order/status    | GET    | Poll order status                 |
| /menu/:storeId   | GET    | Fetch store-specific menu         |
| /loyalty/points  | GET    | Retrieve user loyalty balance     |
| /geo/stores      | GET    | Find stores near coordinates      | 