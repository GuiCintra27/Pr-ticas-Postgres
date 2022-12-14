SELECT testimonials.id, writers.name AS writer, recipients.name AS recipient, testimonials.message
FROM testimonials
    JOIN users AS writers
        ON writers.id = testimonials."writerId"
    JOIN users AS recipients
        ON recipients.id = testimonials."recipientId";