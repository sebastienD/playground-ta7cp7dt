import Tuple_Declaration_Run (createTuple)
import qualified TechIo
import Control.Monad
import Control.Exception
import Data.IORef

currentTest = do
    TechIo.simpleTest (createTuple 1 "Haskell") (1, "Haskell")
    TechIo.simpleTest (createTuple (-1000) "JS is bad") ((-1000), "JS is bad")

main = do
  result <- TechIo.runner currentTest

  case result of
    TechIo.Failure -> do
      TechIo.sendMsg "Astuce 💡" "Humain à ce rythme je vais te battre \x1F914"
    TechIo.Success -> do
      TechIo.sendMsg "Bien joué. 🎆" "Toujours plus vite toujours plus loin"