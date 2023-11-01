CREATE TABLE chat_message (
    message_id NUMBER(10) PRIMARY KEY,
    message_from VARCHAR2(50),
    content CLOB,
    create_at TIMESTAMP,
    chat_room VARCHAR2(50)
);

CREATE SEQUENCE CHAT_MESSAGE_SEQ;