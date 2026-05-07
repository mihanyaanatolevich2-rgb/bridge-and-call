ALTER TABLE public.call_signals
DROP CONSTRAINT IF EXISTS call_signals_signal_type_check;

ALTER TABLE public.call_signals
ADD CONSTRAINT call_signals_signal_type_check
CHECK (signal_type IN ('offer', 'answer', 'ice-candidate', 'hang-up', 'ice-restart-needed'));

CREATE INDEX IF NOT EXISTS idx_call_signals_receiver_call_type_created
ON public.call_signals (receiver_id, call_id, signal_type, created_at DESC);