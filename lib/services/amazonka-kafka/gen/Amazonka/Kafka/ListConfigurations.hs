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
-- Module      : Amazonka.Kafka.ListConfigurations
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of all the MSK configurations in this Region.
--
-- This operation returns paginated results.
module Amazonka.Kafka.ListConfigurations
  ( -- * Creating a Request
    ListConfigurations (..),
    newListConfigurations,

    -- * Request Lenses
    listConfigurations_nextToken,
    listConfigurations_maxResults,

    -- * Destructuring the Response
    ListConfigurationsResponse (..),
    newListConfigurationsResponse,

    -- * Response Lenses
    listConfigurationsResponse_configurations,
    listConfigurationsResponse_nextToken,
    listConfigurationsResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import Amazonka.Kafka.Types
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newListConfigurations' smart constructor.
data ListConfigurations = ListConfigurations'
  { -- | The paginated results marker. When the result of the operation is
    -- truncated, the call returns NextToken in the response. To get the next
    -- batch, provide this token in your next request.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of results to return in the response. If there are
    -- more results, the response includes a NextToken parameter.
    maxResults :: Prelude.Maybe Prelude.Natural
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListConfigurations' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listConfigurations_nextToken' - The paginated results marker. When the result of the operation is
-- truncated, the call returns NextToken in the response. To get the next
-- batch, provide this token in your next request.
--
-- 'maxResults', 'listConfigurations_maxResults' - The maximum number of results to return in the response. If there are
-- more results, the response includes a NextToken parameter.
newListConfigurations ::
  ListConfigurations
newListConfigurations =
  ListConfigurations'
    { nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing
    }

-- | The paginated results marker. When the result of the operation is
-- truncated, the call returns NextToken in the response. To get the next
-- batch, provide this token in your next request.
listConfigurations_nextToken :: Lens.Lens' ListConfigurations (Prelude.Maybe Prelude.Text)
listConfigurations_nextToken = Lens.lens (\ListConfigurations' {nextToken} -> nextToken) (\s@ListConfigurations' {} a -> s {nextToken = a} :: ListConfigurations)

-- | The maximum number of results to return in the response. If there are
-- more results, the response includes a NextToken parameter.
listConfigurations_maxResults :: Lens.Lens' ListConfigurations (Prelude.Maybe Prelude.Natural)
listConfigurations_maxResults = Lens.lens (\ListConfigurations' {maxResults} -> maxResults) (\s@ListConfigurations' {} a -> s {maxResults = a} :: ListConfigurations)

instance Core.AWSPager ListConfigurations where
  page rq rs
    | Core.stop
        ( rs
            Lens.^? listConfigurationsResponse_nextToken
              Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Core.stop
        ( rs
            Lens.^? listConfigurationsResponse_configurations
              Prelude.. Lens._Just
        ) =
      Prelude.Nothing
    | Prelude.otherwise =
      Prelude.Just Prelude.$
        rq
          Prelude.& listConfigurations_nextToken
          Lens..~ rs
          Lens.^? listConfigurationsResponse_nextToken
            Prelude.. Lens._Just

instance Core.AWSRequest ListConfigurations where
  type
    AWSResponse ListConfigurations =
      ListConfigurationsResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListConfigurationsResponse'
            Prelude.<$> (x Core..?> "configurations" Core..!@ Prelude.mempty)
            Prelude.<*> (x Core..?> "nextToken")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListConfigurations

instance Prelude.NFData ListConfigurations

instance Core.ToHeaders ListConfigurations where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath ListConfigurations where
  toPath = Prelude.const "/v1/configurations"

instance Core.ToQuery ListConfigurations where
  toQuery ListConfigurations' {..} =
    Prelude.mconcat
      [ "nextToken" Core.=: nextToken,
        "maxResults" Core.=: maxResults
      ]

-- | /See:/ 'newListConfigurationsResponse' smart constructor.
data ListConfigurationsResponse = ListConfigurationsResponse'
  { -- | An array of MSK configurations.
    configurations :: Prelude.Maybe [Configuration],
    -- | The paginated results marker. When the result of a ListConfigurations
    -- operation is truncated, the call returns NextToken in the response. To
    -- get another batch of configurations, provide this token in your next
    -- request.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListConfigurationsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'configurations', 'listConfigurationsResponse_configurations' - An array of MSK configurations.
--
-- 'nextToken', 'listConfigurationsResponse_nextToken' - The paginated results marker. When the result of a ListConfigurations
-- operation is truncated, the call returns NextToken in the response. To
-- get another batch of configurations, provide this token in your next
-- request.
--
-- 'httpStatus', 'listConfigurationsResponse_httpStatus' - The response's http status code.
newListConfigurationsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListConfigurationsResponse
newListConfigurationsResponse pHttpStatus_ =
  ListConfigurationsResponse'
    { configurations =
        Prelude.Nothing,
      nextToken = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | An array of MSK configurations.
listConfigurationsResponse_configurations :: Lens.Lens' ListConfigurationsResponse (Prelude.Maybe [Configuration])
listConfigurationsResponse_configurations = Lens.lens (\ListConfigurationsResponse' {configurations} -> configurations) (\s@ListConfigurationsResponse' {} a -> s {configurations = a} :: ListConfigurationsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The paginated results marker. When the result of a ListConfigurations
-- operation is truncated, the call returns NextToken in the response. To
-- get another batch of configurations, provide this token in your next
-- request.
listConfigurationsResponse_nextToken :: Lens.Lens' ListConfigurationsResponse (Prelude.Maybe Prelude.Text)
listConfigurationsResponse_nextToken = Lens.lens (\ListConfigurationsResponse' {nextToken} -> nextToken) (\s@ListConfigurationsResponse' {} a -> s {nextToken = a} :: ListConfigurationsResponse)

-- | The response's http status code.
listConfigurationsResponse_httpStatus :: Lens.Lens' ListConfigurationsResponse Prelude.Int
listConfigurationsResponse_httpStatus = Lens.lens (\ListConfigurationsResponse' {httpStatus} -> httpStatus) (\s@ListConfigurationsResponse' {} a -> s {httpStatus = a} :: ListConfigurationsResponse)

instance Prelude.NFData ListConfigurationsResponse