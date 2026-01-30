create or replace PACKAGE pkg_event_manager AS

    -- Exception for custom errors
    e_custom_error EXCEPTION;

    PROCEDURE register_participant(
        p_event_id IN NUMBER,
        p_name     IN VARCHAR2,
        p_email    IN VARCHAR2,
        p_phone    IN VARCHAR2,
        p_status   OUT VARCHAR2
    );

    FUNCTION generate_certificate_uuid(
        p_registration_id IN NUMBER
    ) RETURN VARCHAR2;

    PROCEDURE send_notification(
        p_to_email IN VARCHAR2,
        p_subject  IN VARCHAR2,
        p_body     IN VARCHAR2
    );

END pkg_event_manager;
/

create or replace PACKAGE BODY pkg_event_manager AS

    PROCEDURE register_participant(
        p_event_id IN NUMBER,
        p_name     IN VARCHAR2,
        p_email    IN VARCHAR2,
        p_phone    IN VARCHAR2,
        p_status   OUT VARCHAR2
    ) IS
        v_participant_id NUMBER;
    BEGIN
        -- check if participant exists
        BEGIN
            SELECT participant_id INTO v_participant_id
            FROM participants
            WHERE email = p_email;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- create new participant
                INSERT INTO participants (name, email, phone)
                VALUES (p_name, p_email, p_phone)
                RETURNING participant_id INTO v_participant_id;
        END;

        -- check if already registered
        BEGIN
            INSERT INTO registrations (event_id, participant_id, status)
            VALUES (p_event_id, v_participant_id, 'CONFIRMED');
            
            p_status := 'SUCCESS';
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                p_status := 'ALREADY_REGISTERED';
            WHEN OTHERS THEN
                p_status := 'ERROR: ' || SQLERRM;
        END;
        
        COMMIT;
    END register_participant;

    FUNCTION generate_certificate_uuid(
        p_registration_id IN NUMBER
    ) RETURN VARCHAR2 IS
        v_uuid VARCHAR2(64);
    BEGIN
        -- Check if certificate already exists
        BEGIN
            SELECT certificate_uuid INTO v_uuid
            FROM certificates
            WHERE registration_id = p_registration_id;
            
            RETURN v_uuid;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL; -- Continue to create new
        END;

        -- Create new certificate record
        v_uuid := SYS_GUID();
        
        INSERT INTO certificates (registration_id, certificate_uuid, issued_date)
        VALUES (p_registration_id, v_uuid, SYSDATE);
        
        COMMIT;
        
        RETURN v_uuid;
    END generate_certificate_uuid;

    PROCEDURE send_notification(
        p_to_email IN VARCHAR2,
        p_subject  IN VARCHAR2,
        p_body     IN VARCHAR2
    ) IS
    BEGIN
        -- This is where we would call APEX_WEB_SERVICE.MAKE_REST_REQUEST
        -- For now, we logging via dbms_output or logging table
        -- Apex has built-in mail package: APEX_MAIL
        
        APEX_MAIL.SEND(
            p_to   => p_to_email,
            p_from => 'no-reply@eventportal.com', -- Update with valid sender in APEX
            p_subj => p_subject,
            p_body => p_body
        );
        
        APEX_MAIL.PUSH_QUEUE;
    EXCEPTION
        WHEN OTHERS THEN
            NULL; -- Handle error logging
    END send_notification;

END pkg_event_manager;
/
