#define Dmake_cv_name(n) opuser##n  
#define make_cv_name(n) Dmake_cv_name(n)  
  
#define Dmake_cv_struct(n) _opuser##n  
#define _make_cv_name(n) Dmake_cv_struct(n)  
  
#define _make_cv_use(n) use##n  
#define make_cv_use(n) _make_cv_use(n)  
  
#ifndef copy_cv_properties  
#define copy_cv_properties(a,b) cvmod(a, _##b.minval,_##b.maxval,_##b.defval,_##b.descr,0,"")  
#endif  
  
#define SET_CV_DEF(n) make_cv_name(n)=_make_cv_name(n).fixedflag?((void)_make_cv_name(n).defval,make_cv_name(n)):_make_cv_name(n).defval;  
  
#ifndef SET_USER_CV  
#define SET_USER_CV( act_cv , n ) \  
if(  n < 31 ){\  
piuset |=make_cv_use(n);\  
}else{ \  
piuset2 |=make_cv_use(n);\  
}\  
copy_cv_properties(make_cv_name(n),act_cv);\  
SET_CV_DEF(n)\  
act_cv=(int)(exist(make_cv_name(n)));  
#endif 


/* Set user 22 to mycv */  
/*SET_USER_CV( mycv , 22 );*/
