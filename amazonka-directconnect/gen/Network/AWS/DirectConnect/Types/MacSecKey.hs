{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DirectConnect.Types.MacSecKey
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.DirectConnect.Types.MacSecKey where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Information about the MAC Security (MACsec) secret key.
--
-- /See:/ 'newMacSecKey' smart constructor.
data MacSecKey = MacSecKey'
  { -- | The date that the MAC Security (MACsec) secret key takes effect. The
    -- value is displayed in UTC format.
    startOn :: Prelude.Maybe Prelude.Text,
    -- | The Connection Key Name (CKN) for the MAC Security secret key.
    ckn :: Prelude.Maybe Prelude.Text,
    -- | The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.
    secretARN :: Prelude.Maybe Prelude.Text,
    -- | The state of the MAC Security (MACsec) secret key.
    --
    -- The possible values are:
    --
    -- -   @associating@: The MAC Security (MACsec) secret key is being
    --     validated and not yet associated with the connection or LAG.
    --
    -- -   @associated@: The MAC Security (MACsec) secret key is validated and
    --     associated with the connection or LAG.
    --
    -- -   @disassociating@: The MAC Security (MACsec) secret key is being
    --     disassociated from the connection or LAG
    --
    -- -   @disassociated@: The MAC Security (MACsec) secret key is no longer
    --     associated with the connection or LAG.
    state :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'MacSecKey' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'startOn', 'macSecKey_startOn' - The date that the MAC Security (MACsec) secret key takes effect. The
-- value is displayed in UTC format.
--
-- 'ckn', 'macSecKey_ckn' - The Connection Key Name (CKN) for the MAC Security secret key.
--
-- 'secretARN', 'macSecKey_secretARN' - The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.
--
-- 'state', 'macSecKey_state' - The state of the MAC Security (MACsec) secret key.
--
-- The possible values are:
--
-- -   @associating@: The MAC Security (MACsec) secret key is being
--     validated and not yet associated with the connection or LAG.
--
-- -   @associated@: The MAC Security (MACsec) secret key is validated and
--     associated with the connection or LAG.
--
-- -   @disassociating@: The MAC Security (MACsec) secret key is being
--     disassociated from the connection or LAG
--
-- -   @disassociated@: The MAC Security (MACsec) secret key is no longer
--     associated with the connection or LAG.
newMacSecKey ::
  MacSecKey
newMacSecKey =
  MacSecKey'
    { startOn = Prelude.Nothing,
      ckn = Prelude.Nothing,
      secretARN = Prelude.Nothing,
      state = Prelude.Nothing
    }

-- | The date that the MAC Security (MACsec) secret key takes effect. The
-- value is displayed in UTC format.
macSecKey_startOn :: Lens.Lens' MacSecKey (Prelude.Maybe Prelude.Text)
macSecKey_startOn = Lens.lens (\MacSecKey' {startOn} -> startOn) (\s@MacSecKey' {} a -> s {startOn = a} :: MacSecKey)

-- | The Connection Key Name (CKN) for the MAC Security secret key.
macSecKey_ckn :: Lens.Lens' MacSecKey (Prelude.Maybe Prelude.Text)
macSecKey_ckn = Lens.lens (\MacSecKey' {ckn} -> ckn) (\s@MacSecKey' {} a -> s {ckn = a} :: MacSecKey)

-- | The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.
macSecKey_secretARN :: Lens.Lens' MacSecKey (Prelude.Maybe Prelude.Text)
macSecKey_secretARN = Lens.lens (\MacSecKey' {secretARN} -> secretARN) (\s@MacSecKey' {} a -> s {secretARN = a} :: MacSecKey)

-- | The state of the MAC Security (MACsec) secret key.
--
-- The possible values are:
--
-- -   @associating@: The MAC Security (MACsec) secret key is being
--     validated and not yet associated with the connection or LAG.
--
-- -   @associated@: The MAC Security (MACsec) secret key is validated and
--     associated with the connection or LAG.
--
-- -   @disassociating@: The MAC Security (MACsec) secret key is being
--     disassociated from the connection or LAG
--
-- -   @disassociated@: The MAC Security (MACsec) secret key is no longer
--     associated with the connection or LAG.
macSecKey_state :: Lens.Lens' MacSecKey (Prelude.Maybe Prelude.Text)
macSecKey_state = Lens.lens (\MacSecKey' {state} -> state) (\s@MacSecKey' {} a -> s {state = a} :: MacSecKey)

instance Core.FromJSON MacSecKey where
  parseJSON =
    Core.withObject
      "MacSecKey"
      ( \x ->
          MacSecKey'
            Prelude.<$> (x Core..:? "startOn")
            Prelude.<*> (x Core..:? "ckn")
            Prelude.<*> (x Core..:? "secretARN")
            Prelude.<*> (x Core..:? "state")
      )

instance Prelude.Hashable MacSecKey

instance Prelude.NFData MacSecKey
