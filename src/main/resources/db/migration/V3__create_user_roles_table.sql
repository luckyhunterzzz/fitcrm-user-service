CREATE TABLE user_roles (
                            id BIGSERIAL PRIMARY KEY,
                            user_id BIGINT REFERENCES users(id) NOT NULL,
                            role_id BIGINT REFERENCES roles(id) NOT NULL
);

CREATE INDEX idx_user_roles_user_id ON user_roles(user_id);
CREATE INDEX idx_user_roles_role_id ON user_roles(role_id);

COMMENT ON TABLE user_roles IS 'Many-to-many relationship between users and roles';
COMMENT ON COLUMN user_roles.user_id IS 'Reference to users.id';
COMMENT ON COLUMN user_roles.role_id IS 'Reference to roles.id';