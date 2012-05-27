incomplete concrete ExtraRomance of ExtraRomanceAbs = CatRomance **
  open 
    CommonRomance,
    Coordination,
    ResRomance, 
    Prelude in {

    lin TPasseSimple = {s = []} ** {t = RPasse} ;   --# notpresent

  lin ComplCN v cn = insertComplement (\\_ => prepCase v.c2.c ++ cn.s ! Sg) (predV v) ;

  lincat
    VPI   = {s : Str} ;
    [VPI] = {s1,s2 : Str} ;
  lin
    BaseVPI = twoSS ;
    ConsVPI = consrSS comma ;

    MkVPI vp = {s = infVP vp (agrP3 Masc Sg)} ;
    ConjVPI = conjunctDistrSS ;
    ComplVPIVV v vpi = 
      insertComplement (\\a => prepCase v.c2.c ++ vpi.s) (predV v) ;

    ProDrop p = {
      s = table {
        Nom => let pn = p.s ! Nom in {c1 = pn.c1 ; c2 = pn.c2 ; comp = [] ; ton = pn.ton} ; 
        c => p.s ! c
        } ;
      a = p.a ;
      poss = p.poss ;
      hasClit = p.hasClit ;
      isPol = p.isPol ;
      isNeg = False
      } ;

    CompIQuant iq = {s = \\aa => iq.s ! aa.n ! aa.g ! Nom} ;

    PrepCN prep cn = {s = prep.s ++ prepCase prep.c ++ cn.s ! Sg} ;
    
  lincat
    VPS   = {s : Mood => Agr => Bool => Str} ;
    [VPS] = {s1,s2 : Mood => Agr => Bool => Str} ;

  lin
    BaseVPS x y = {
      s1 = \\m,a,b => x.s ! m ! a ! b ;
      s2 = \\m,a,b => subjPron a ++ y.s ! m ! a ! b
      } ;

    ConsVPS x y = {
      s1 = \\m,a,b => x.s ! m ! a ! b ;
      s2 = \\m,a,b => subjPron a ++ y.s1 ! m ! a ! b ++ y.s2 ! m ! a ! b
      } ;

    PredVPS np vpi = {
      s = \\m => (np.s ! Nom).comp ++ vpi.s ! m ! np.a ! np.isNeg
      } ;

    MkVPS tm p vp = {
      s = \\m,agr,isNeg => 
          tm.s ++ p.s ++
          (mkClausePol (orB isNeg vp.isNeg) [] False False agr vp).s 
            ! DDir ! tm.t ! tm.a ! p.p ! m
      } ;

    ConjVPS = conjunctDistrTable3 Mood Agr Bool ;


} 
