{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.StepFunctions.SendTaskHeartbeat
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Used by activity workers and task states using the
-- <https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token callback>
-- pattern to report to Step Functions that the task represented by the
-- specified @taskToken@ is still making progress. This action resets the
-- @Heartbeat@ clock. The @Heartbeat@ threshold is specified in the state
-- machine\'s Amazon States Language definition (@HeartbeatSeconds@). This
-- action does not in itself create an event in the execution history.
-- However, if the task times out, the execution history contains an
-- @ActivityTimedOut@ entry for activities, or a @TaskTimedOut@ entry for
-- for tasks using the
-- <https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync job run>
-- or
-- <https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token callback>
-- pattern.
--
-- The @Timeout@ of a task, defined in the state machine\'s Amazon States
-- Language definition, is its maximum allowed duration, regardless of the
-- number of SendTaskHeartbeat requests received. Use @HeartbeatSeconds@ to
-- configure the timeout interval for heartbeats.
module Network.AWS.StepFunctions.SendTaskHeartbeat
  ( -- * Creating a Request
    SendTaskHeartbeat (..),
    newSendTaskHeartbeat,

    -- * Request Lenses
    sendTaskHeartbeat_taskToken,

    -- * Destructuring the Response
    SendTaskHeartbeatResponse (..),
    newSendTaskHeartbeatResponse,

    -- * Response Lenses
    sendTaskHeartbeatResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response
import Network.AWS.StepFunctions.Types

-- | /See:/ 'newSendTaskHeartbeat' smart constructor.
data SendTaskHeartbeat = SendTaskHeartbeat'
  { -- | The token that represents this task. Task tokens are generated by Step
    -- Functions when tasks are assigned to a worker, or in the
    -- <https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html context object>
    -- when a workflow enters a task state. See
    -- GetActivityTaskOutput$taskToken.
    taskToken :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'SendTaskHeartbeat' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'taskToken', 'sendTaskHeartbeat_taskToken' - The token that represents this task. Task tokens are generated by Step
-- Functions when tasks are assigned to a worker, or in the
-- <https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html context object>
-- when a workflow enters a task state. See
-- GetActivityTaskOutput$taskToken.
newSendTaskHeartbeat ::
  -- | 'taskToken'
  Prelude.Text ->
  SendTaskHeartbeat
newSendTaskHeartbeat pTaskToken_ =
  SendTaskHeartbeat' {taskToken = pTaskToken_}

-- | The token that represents this task. Task tokens are generated by Step
-- Functions when tasks are assigned to a worker, or in the
-- <https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html context object>
-- when a workflow enters a task state. See
-- GetActivityTaskOutput$taskToken.
sendTaskHeartbeat_taskToken :: Lens.Lens' SendTaskHeartbeat Prelude.Text
sendTaskHeartbeat_taskToken = Lens.lens (\SendTaskHeartbeat' {taskToken} -> taskToken) (\s@SendTaskHeartbeat' {} a -> s {taskToken = a} :: SendTaskHeartbeat)

instance Core.AWSRequest SendTaskHeartbeat where
  type
    AWSResponse SendTaskHeartbeat =
      SendTaskHeartbeatResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveEmpty
      ( \s h x ->
          SendTaskHeartbeatResponse'
            Prelude.<$> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable SendTaskHeartbeat

instance Prelude.NFData SendTaskHeartbeat

instance Core.ToHeaders SendTaskHeartbeat where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "AWSStepFunctions.SendTaskHeartbeat" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.0" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON SendTaskHeartbeat where
  toJSON SendTaskHeartbeat' {..} =
    Core.object
      ( Prelude.catMaybes
          [Prelude.Just ("taskToken" Core..= taskToken)]
      )

instance Core.ToPath SendTaskHeartbeat where
  toPath = Prelude.const "/"

instance Core.ToQuery SendTaskHeartbeat where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newSendTaskHeartbeatResponse' smart constructor.
data SendTaskHeartbeatResponse = SendTaskHeartbeatResponse'
  { -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'SendTaskHeartbeatResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'httpStatus', 'sendTaskHeartbeatResponse_httpStatus' - The response's http status code.
newSendTaskHeartbeatResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  SendTaskHeartbeatResponse
newSendTaskHeartbeatResponse pHttpStatus_ =
  SendTaskHeartbeatResponse'
    { httpStatus =
        pHttpStatus_
    }

-- | The response's http status code.
sendTaskHeartbeatResponse_httpStatus :: Lens.Lens' SendTaskHeartbeatResponse Prelude.Int
sendTaskHeartbeatResponse_httpStatus = Lens.lens (\SendTaskHeartbeatResponse' {httpStatus} -> httpStatus) (\s@SendTaskHeartbeatResponse' {} a -> s {httpStatus = a} :: SendTaskHeartbeatResponse)

instance Prelude.NFData SendTaskHeartbeatResponse
