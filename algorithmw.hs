module AlgorithmW where

import qualified Data.Map as Map
import qualified Data.Set as Set

import Control.Monad.Error
import Control.Monad.Reader
import Control.Monad.State

import qualified Text.PrettyPrint as PP

data Exp = EVar String
        | ELit Lit
        | EApp Exp Exp
        | EAbs String Exp
        | ELet String Exp
        deriving (Eq, Ord)

data Lit = LInt Integer
        | LBool Bool
        deriving (Eq, Ord)

data Type = TVar String
        | TInt
        | TBool
        | TFun Type Type
        deriving (Eq, Ord)

data Scheme = Scheme [String] Type

