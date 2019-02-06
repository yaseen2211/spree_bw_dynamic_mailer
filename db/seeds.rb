Spree::EmailContent.find_or_create_by! subject: "Order Confirmation Mail",reason: "Order", module_name: "Spree::Order", template: "Order Confirmation Email Content"
