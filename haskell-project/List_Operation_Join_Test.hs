import List_Operation_Join_Run (joinList)
import qualified TechIo
import qualified TechIoMockFunction as Mock
import Control.Monad
import Control.Exception
import Data.IORef

currentTest = do
    TechIo.simpleTest (joinList [1..4] []) [1..4]
    TechIo.simpleTest (joinList [] [1..4]) [1..4]
    TechIo.simpleTest (joinList [1..4] [5..8]) [1..8]

simpleRunner tests = handle TechIo.assertHandler $ do
            tests
            return TechIo.Success

main = do
  result <- simpleRunner currentTest

  case result of
    TechIo.Failure -> do
      TechIo.sendMsg "Astuce 💡" "Humain à ce rythme je vais te battre \x1F914"
    TechIo.Success -> do
      used <- Mock.isFunctionUsed
      case used of
        True -> do
          TechIo.sendMsg "Bien joué. 🎆" "Toujours plus vite toujours plus loin"
          TechIo.success
        False -> do
          TechIo.sendMsg "Oops! 🐞" "N'essaye pas de m'avoir humain utilise la de concaténation de fonction!"
          TechIo.failure