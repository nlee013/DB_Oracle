--2021.01.27.��

--SYSTEM

--���� �ֱ�

GRANT CREATE USER TO kim;

SELECT * FROM DBA_USERS;

--��� �߸� �Է½� LOCKED ������ ���.

ALTER USER TEST ACCOUNT LOCK;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO TEST;--�����ֱ�

ALTER USER TEST ACCOUNT UNLOCK;

ALTER USER TEST IDENTIFIED BY ABC ACCOUNT UNLOCK;--ID�� ���� �ٲٰ� ����

REVOKE CREATE USER FROM kim;--���� ����

--������ ����
/*
SYSTEM ���� : DATA BASE�� OBJECT����
			  ����(CREATE), ����(ALTER), ����(DROP) �� �� �ִ� ����
			  DBA(������) -> USERS(�Ϲݻ����)
			  
OBJECT ���� : OBJECT ������ �߰�(INSERT), ����(UPDATE), ����(DELETE), �˻�(SELECT)��
			  �� �� �ִ� ����
			  USERS(�Ϲݻ����) -> USERS(�Ϲݻ����)
			  EX) kim -> lee
			  
OBJECT: TABLE, SEQUENCE, VIEW, DOMAIN
*/

--SYSTEM ����
SELECT * FROM SYSTEM_PRIVILEGE_MAP;
--������ 

GRANT CREATE SESSION TO SUZI;
GRANT CREATE SESSION, RESOURCE, UNLIMITED TABLESPACE TO SUZI;

REVOKE RESOURCE, UNLIMITED TABLESPACE FROM SUZI;

--�ٸ� ����ڰ� ���� �� ���� �ž߾�

--OBJECT ���� : kim���� �غ���. ���� SYS������ ����


--ROLE
--KIM�̶�� ����ڰ� ROLE ���� ���� �� ����
GRANT CREATE ROLE TO KIM;

CREATE ROLE MANAGER;
--DROP ROLE MANAGER1;
GRANT CREATE USER, CREATE VIEW TO MANAGER; --������ 2���� ?

SELECT * FROM DBA_ROLES;--DICTIONARY�� �׻� ���� S ����

--�����ڷ� ������ �� �� �ִ�(������ ���� ����)

SELECT * FROM ROLE_SYS_PRIVS;

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE = 'MANAGER';

--KIM���� �ؾ�?
--SELECT * FROM ROLE_SYS_PRIVS
--WHERE ROLE IN ('CONNECT', 'RESOURCE');

GRANT MANAGER TO SUZI;--(CREATE VIEW, CREATE USERS)�� ������ SUZI���� ����

REVOKE MANAGER FROM SUZI;

--ROLE�� ������ EXIT �ؾ�?. ������ �������� ����?.