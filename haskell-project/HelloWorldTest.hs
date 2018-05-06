import HelloWorldRun (helloWorld)
import qualified TechIo
import Control.Monad
import Control.Exception
import Data.IORef

currentTest = do
    TechIo.simpleTest helloWorld "Bonjour Haskell"

main = do
  result <- TechIo.runner currentTest

  case result of
    TechIo.Failure -> do
      TechIo.sendMsg "Astuce 💡" "Pourquoi tant de haine et ne pas simplement dire Bonjour Haskell? \x1F914"
    TechIo.Success -> do
      TechIo.sendMsg "Gagné. 🙏" "Bien joué voilà la premiére étape franchie"