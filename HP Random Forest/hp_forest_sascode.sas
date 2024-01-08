%macro em_hpfst_score;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
  %if %symexist(hpfst_id_vars)=0 %then %let hpfst_id_vars = _ALL_;
 
  %let hpvvn= %sysfunc(getoption(VALIDVARNAME));
  options validvarname=V7;
  proc hp4score data=&hpfst_score_input;
  id &hpfst_id_vars;
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
      %let hpfinEM=1;
    score file="/home/u63437975/WQD7005_AA1/Workspaces/EMWS1/HPDMForest/OUTMDLFILE.bin" out=&hpfst_score_output;
  %end;
  %else %do;
      %let hpfinEM=0;
      score file="&EM_USER_OUTMDLFILE" out=&hpfst_score_output;
  %end;
    PERFORMANCE;
  run;
 
  options validvarname=&hpvvn;
 
  data &hpfst_score_output;
     set &hpfst_score_output;
     %if &hpfinEM %then %do;
         %symdel hpfst_score_input hpfst_score_output  EM_USER_OUTMDLFILE  / nowarn; 
     %end;
%mend;
 
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Classification Vars: Churn;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
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
