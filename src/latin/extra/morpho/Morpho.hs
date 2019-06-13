module Morpho where

data Person = P1 | P2 | P3
  deriving (Show,Read) ;
data Gender = Fem | Masc | Neut
  deriving (Show,Read) ;
data Case = Nom | Gen | Dat | Acc | Abl | Voc
  deriving (Show,Read);
data Number = Sg | Pl
  deriving (Show,Read);
data Voice = Active | Passive | Deponens
  deriving (Show,Read) ;
data POS = ADJ | ADV | CONJ | INTJ | N | NUM | PN | PREP| PRO| V | PART
  deriving (Show,Read) ;
data Tense = Pres| FutureI | FutureII | Future | Imperf | Perf | Pqperf
  deriving (Show,Read) ;
data Degree = Positive | Comparative | Superlative
  deriving (Show,Read) ;
data Mood = Ind | Subj
  deriving (Show,Read);
data NumberType = Card | Ord | Dist | Dig
  deriving (Show,Read) ;
data PronounType = Dem | Indef | Pers | Poss | Quest | Refl | Rel | Adj
  deriving (Show,Read) ;
data VerbType = SupinI | SupinII | Gerund | Gerundivum | Inf | Imp | Part
  deriving (Show,Read) ;
data  Wordform = Cap | UC | I2j | Alt
  deriving (Show,Read) ;
data Feat = Person Person
  | Gender Gender
  | Case Case
  | Number Number
  | Voice Voice
  | POS POS
  | Tense Tense
  | Degree Degree
  | Mood Mood
  | NumberType NumberType
  | PronounType PronounType
  | VerbType VerbType
  | Wordform Wordform
  deriving (Show,Read) ;

data Analysis = Analysis String [Lemma] deriving (Show,Read) ;
data Lemma = Lemma String [Feat] deriving (Show,Read) ;

-- show $ Analysis "abdiderant" [Lemma "abdere" [POS V, Mood Ind, Tense Pqperf, Voice Active, Person P3]]

