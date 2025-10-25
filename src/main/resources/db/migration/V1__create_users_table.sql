CREATE TABLE users (
                       id BIGSERIAL PRIMARY KEY,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       first_name VARCHAR(50),
                       last_name VARCHAR(50),
                       created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
                       updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

COMMENT ON TABLE users IS 'Stores user accounts. Email is used for authentication.';
COMMENT ON COLUMN users.id IS 'Unique identifier of the user';
COMMENT ON COLUMN users.email IS 'User email, used as login (unique)';
COMMENT ON COLUMN users.password_hash IS 'BCrypt hash of the password';
COMMENT ON COLUMN users.first_name IS 'Optional first name';
COMMENT ON COLUMN users.last_name IS 'Optional last name';
COMMENT ON COLUMN users.created_at IS 'When the user was created';
COMMENT ON COLUMN users.updated_at IS 'When the user was last updated';