%macro em_hpfst_score;
 
  %if %sysfunc(exist(work._score_temp)) %then %do;
     proc delete data=work._score_temp;
     run;
  %end;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
 
%let hpvvn= %sysfunc(getoption(VALIDVARNAME));
options validvarname=V7;
  proc hp4score data=&hpfst_score_input(keep=
Average_Rating
City
Days_Since_Last_Purchase
Discount_Applied_Binary
FavoriteCategory
Gender_Binary
IMP_Satisfaction_Level
LOG_IMP_Age
LOG_Items_Purchased
Membership_Type
Total_Spend
  ); 
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
    score file="/home/u63437975/WQD7005_AA1/Workspaces/EMWS1/HPDMForest/OUTMDLFILE.bin" out=work._outtemp;
  %end;
  %else %do;
    score file="&EM_USER_OUTMDLFILE" out=work._outtemp;
  %end;
    PERFORMANCE nthreads=1;
  run;
 
options validvarname=&hpvvn;
  data work._score_temp;
     merge &hpfst_score_input work._outtemp;
  run;
 
  proc delete data=work._outtemp;
  run;
 
  data &hpfst_score_output;
    set work._score_temp;
%mend;
 
%symdel hpfst_score_input hpfst_score_output EM_USER_OUTMDLFILE/nowarn;
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Classification Vars: Churn;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
length F_Churn $12;
label  F_Churn = 'From: Churn';
_format200= PUT( Churn, BEST12. );
F_Churn=dmnorm(_format200,32); ;
_format200= ' ' ;
length _p_ 8;
_p_= 0 ;
drop _p_ ;
if P_Churn1 - _p_ > 1E-8 then do ;
   _p_= P_Churn1 ;
   _format200='1';
end;
if P_Churn0 - _p_ > 1E-8 then do ;
   _p_= P_Churn0 ;
   _format200='0';
end;
I_Churn=dmnorm(_format200,32); ;
length U_Churn 8;
label U_Churn = 'Unnormalized Into: Churn';
format U_Churn BEST12.;
if I_Churn='1' then
U_Churn=1;
if I_Churn='0' then
U_Churn=0;
*------------------------------------------------------------*;
*Computing Residual Vars: Churn;
*------------------------------------------------------------*;
Length R_Churn1 8;
Label R_Churn1='Residual: Churn=1';
Length R_Churn0 8;
Label R_Churn0='Residual: Churn=0';
if 
 F_Churn ne '1'
and F_Churn ne '0'
 then do;
R_Churn1=.;
R_Churn0=.;
end;
else do;
R_Churn1= - P_Churn1;
R_Churn0= - P_Churn0;
select(F_Churn);
when('1')R_Churn1= R_Churn1+1;
when('0')R_Churn0= R_Churn0+1;
otherwise;
end;
end;
