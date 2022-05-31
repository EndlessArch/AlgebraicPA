-- A definition of Natural Numbers

module Nat where
import GHC.Generics (UInt)

-- 아직 고딩이라 집합론은 잘 모르기 때문에...
-- 자연수는 우선 비부호 정수 타입으로 설정했습니다.
-- 페아노 공리계는 이해했지만, 어떻게 실재 숫자와 연관지어야할 지 감이 안오는데다가,
-- 메모리 사용량이 매우 클 것 같네요
type Nat = UInt