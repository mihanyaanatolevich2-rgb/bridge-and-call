ALTER TABLE public.messages
DROP CONSTRAINT IF EXISTS messages_message_type_check;

ALTER TABLE public.messages
ADD CONSTRAINT messages_message_type_check
CHECK (message_type IN ('text', 'image', 'file', 'video', 'audio', 'voice', 'video_circle'));

CREATE INDEX IF NOT EXISTS idx_messages_conversation_created_at
ON public.messages (conversation_id, created_at);