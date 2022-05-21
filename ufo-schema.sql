-- USER TABLE
DROP 
  TABLEIF EXISTS ufo.USER.USER;
CREATE TABLE ufo.USER.USER (
  id SERIAL PRIMARY KEY, 
  phone VARCHAR (255) UNIQUE NOT NULL, 
  email VARCHAR (255) UNIQUE NOT NULL, 
  NAME VARCHAR (255) DEFAULT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- TIMER
TABLEDROP TABLEIF EXISTS ufo.notification.timer;
CREATE TABLE ufo.notification.timer (
  id SERIAL PRIMARY KEY, 
  value SMALLINT, 
  description VARCHAR (255), 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- NOTIFICATION_TYPE
TABLEDROP TABLEIF EXISTS ufo.notification.type;
CREATE TABLE ufo.notification.type (
  id SERIAL PRIMARY KEY, 
  NAME VARCHAR (255) NOT NULL, 
  timer_id INT NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (timer_id) REFERENCES ufo.notification.timer (id)
);
-- USER_NOTIFICATION_LOG
TABLEDROP TABLEIF EXISTS ufo.notification.log;
CREATE TABLE ufo.notification.log (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  notification_type_id INT NOT NULL, 
  status SMALLINT NOT NULL, 
  details JSON NOT NULL, 
  cost DECIMAL DEFAULT 0, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES USER (id), 
  FOREIGN KEY (notification_type_id) REFERENCES ufo.notification.type (id)
);
-- USER_SETTINGS
TABLEDROP TABLEIF EXISTS ufo.USER.settings;
CREATE TABLE ufo.USER.settings (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  notification_type_id INT NOT NULL, 
  status SMALLINT NOT NULL, 
  options JSON NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.USER.USER (id), 
  FOREIGN KEY (notification_type_id) REFERENCES ufo.notification.type (id)
);
-- FINANCE_OPERATIONS
TABLEDROP TABLEIF EXISTS ufo.finance.financial_operations;
CREATE TABLE ufo.finance.financial_operations (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  status SMALLINT NOT NULL, 
  amount DECIMAL, 
  details JSON NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.USER.USER (id)
);
-- QR 
TABLEDROP TABLEIF EXISTS ufo.notification.qr;
CREATE TABLE ufo.notification.qr (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  status SMALLINT NOT NULL, 
  qr_svg VARCHAR (255), 
  qr_url VARCHAR (255), 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.USER.USER (id)
);
-- PASSWORD 
TABLEDROP TABLEIF EXISTS ufo.USER.password;
CREATE TABLE ufo.USER.password (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  password VARCHAR (255) NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.USER.USER (id)
);
-- SUBSCRIPTION 
TABLEDROP TABLEIF EXISTS ufo.subscription.subscription;
CREATE TABLE ufo.subscription.subscription (
  id SERIAL PRIMARY KEY, 
  description VARCHAR (255), 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- USER_SUBSCRIPTION 
TABLEDROP TABLEIF EXISTS ufo.finance.subscription;
CREATE TABLE ufo.finance.subscription (
  id SERIAL PRIMARY KEY, 
  subscription_id INT NOT NULL, 
  user_id INT NOT NULL, 
  status SMALLINT NOT NULL, 
  start_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  expired_at TIMESTAMP, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.USER (id), 
  FOREIGN KEY (subscription_id) REFERENCES ufo.subscription (id)
);
-- AVATARS 
TABLEDROP TABLEIF EXISTS ufo.media.avatars;
CREATE TABLE ufo.media.avatars (
  id SERIAL PRIMARY KEY, 
  img VARCHAR (255), 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- USER_AVATARS 
TABLEDROP TABLEIF EXISTS ufo.USER.avatars;
CREATE TABLE ufo.USER.avatars (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL UNIQUE, 
  avatar_id INT NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.user.user, 
  FOREIGN KEY (avatar_id) REFERENCES ufo.media.avatars
);
CREATE TABLE ufo.user.confirmations (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL, 
  sms_code varchar(255), 
  email_hash varchar(255), 
  type SMALLINT NOT NULL, 
  status SMALLINT NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (user_id) REFERENCES ufo.user.user, 
  ) 
  
  

