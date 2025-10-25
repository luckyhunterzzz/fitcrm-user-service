CREATE TABLE roles (
                       id SMALLSERIAL PRIMARY KEY,
                       name VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO roles (name) VALUES
                             ('ADMIN'),
                             ('TRAINER'),
                             ('CLIENT');

CREATE INDEX idx_roles_name ON roles(name);

COMMENT ON TABLE roles IS 'Available user roles in the system';
COMMENT ON COLUMN roles.id IS 'Unique identifier of the role';
COMMENT ON COLUMN roles.name IS 'Role name: ADMIN, TRAINER, CLIENT';