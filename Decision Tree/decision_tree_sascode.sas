****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_Churn  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Churn1 = 'Predicted: Churn=1' ;
label P_Churn0 = 'Predicted: Churn=0' ;
label Q_Churn1 = 'Unadjusted P: Churn=1' ;
label Q_Churn0 = 'Unadjusted P: Churn=0' ;
label I_Churn = 'Into: Churn' ;
label U_Churn = 'Unnormalized Into: Churn' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_11 $     11; DROP _ARBFMT_11;
_ARBFMT_11 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_13 $     13; DROP _ARBFMT_13;
_ARBFMT_13 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_11 = PUT( FavoriteCategory , $11.);
 %DMNORMIP( _ARBFMT_11);
IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
  IF _ARBFMT_13 IN ('HOUSTON' ,'CHICAGO' ) THEN DO;
    IF  NOT MISSING(LOG_IMP_Age ) AND
      LOG_IMP_Age  <     3.51143404304132 THEN DO;
      _NODE_  =                   12;
      _LEAF_  =                    5;
      P_Churn1  =     0.16666666666666;
      P_Churn0  =     0.83333333333333;
      Q_Churn1  =     0.16666666666666;
      Q_Churn0  =     0.83333333333333;
      I_Churn  = '0' ;
      U_Churn  =                    0;
      END;
    ELSE DO;
      _NODE_  =                   13;
      _LEAF_  =                    6;
      P_Churn1  =     0.51851851851851;
      P_Churn0  =     0.48148148148148;
      Q_Churn1  =     0.51851851851851;
      Q_Churn0  =     0.48148148148148;
      I_Churn  = '1' ;
      U_Churn  =                    1;
      END;
    END;
  ELSE DO;
    _NODE_  =                    7;
    _LEAF_  =                    7;
    P_Churn1  =     0.59493670886075;
    P_Churn0  =     0.40506329113924;
    Q_Churn1  =     0.59493670886075;
    Q_Churn0  =     0.40506329113924;
    I_Churn  = '1' ;
    U_Churn  =                    1;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(LOG_IMP_Age ) AND
    LOG_IMP_Age  <     3.31402068808976 THEN DO;
    IF  NOT MISSING(Average_Rating ) AND
      Average_Rating  <                 3.75 THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_Churn1  =     0.52941176470588;
      P_Churn0  =     0.47058823529411;
      Q_Churn1  =     0.52941176470588;
      Q_Churn0  =     0.47058823529411;
      I_Churn  = '1' ;
      U_Churn  =                    1;
      END;
    ELSE DO;
      _NODE_  =                    9;
      _LEAF_  =                    2;
      P_Churn1  =     0.23214285714285;
      P_Churn0  =     0.76785714285714;
      Q_Churn1  =     0.23214285714285;
      Q_Churn0  =     0.76785714285714;
      I_Churn  = '0' ;
      U_Churn  =                    0;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(LOG_Items_Purchased ) AND
          2.97008562636021 <= LOG_Items_Purchased  THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    4;
      P_Churn1  =     0.51428571428571;
      P_Churn0  =     0.48571428571428;
      Q_Churn1  =     0.51428571428571;
      Q_Churn0  =     0.48571428571428;
      I_Churn  = '1' ;
      U_Churn  =                    1;
      END;
    ELSE DO;
      _NODE_  =                   10;
      _LEAF_  =                    3;
      P_Churn1  =     0.41240875912408;
      P_Churn0  =     0.58759124087591;
      Q_Churn1  =     0.41240875912408;
      Q_Churn0  =     0.58759124087591;
      I_Churn  = '0' ;
      U_Churn  =                    0;
      END;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
