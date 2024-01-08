****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_Churn  $   12; 
LENGTH I_Churn  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_Churn1 = 'Predicted: Churn=1' ;
      P_Churn1  = 0;
label P_Churn0 = 'Predicted: Churn=0' ;
      P_Churn0  = 0;
label Q_Churn1 = 'Unadjusted P: Churn=1' ;
      Q_Churn1  = 0;
label Q_Churn0 = 'Unadjusted P: Churn=0' ;
      Q_Churn0  = 0;
label R_Churn1 = 'Residual: Churn=1' ;
label R_Churn0 = 'Residual: Churn=0' ;
label F_Churn = 'From: Churn' ;
label I_Churn = 'Into: Churn' ;
label U_Churn = 'Unnormalized Into: Churn' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_13 $     13; DROP _ARBFMT_13; 
_ARBFMT_13 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_11 $     11; DROP _ARBFMT_11; 
_ARBFMT_11 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_6 $      6; DROP _ARBFMT_6; 
_ARBFMT_6 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( Churn , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_Churn );

 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 0.0564323779;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE  1263 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.045174754;
      END;
    END;
  END;

********** LEAF     2  NODE  1264 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0096476413;
      END;
    END;
  END;

********** LEAF     3  NODE  1265 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                 1447 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0101219141;
      END;
    END;
  END;

********** LEAF     4  NODE  1266 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                      1447 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.034317741;
      END;
    END;
  END;

********** LEAF     5  NODE  1270 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ,'BOOKS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.51143404304132 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.009650595;
      END;
    END;
  END;

********** LEAF     6  NODE  1271 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ,'BOOKS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.51143404304132 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017862486;
      END;
    END;
  END;

********** LEAF     7  NODE  1272 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 3.95 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004955144;
      END;
    END;
  END;

********** LEAF     8  NODE  1273 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      3.95 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0426628347;
      END;
    END;
  END;

********** LEAF     9  NODE  1277 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                690.8 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               669.65 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0060697138;
      END;
    END;
  END;

********** LEAF    10  NODE  1278 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                690.8 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    669.65 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0635185437;
      END;
    END;
  END;

********** LEAF    11  NODE  1279 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   690.8 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  769 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.066817906;
      END;
    END;
  END;

********** LEAF    12  NODE  1280 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   690.8 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       769 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000608448;
      END;
    END;
  END;

********** LEAF    13  NODE  1284 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 16.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0509577908;
      END;
    END;
  END;

********** LEAF    14  NODE  1285 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      16.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0061724398;
      END;
    END;
  END;

********** LEAF    15  NODE  1286 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('SATISFIED' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.035286623;
      END;
    END;
  END;

********** LEAF    16  NODE  1287 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('NEUTRAL' ,'UNSATISFIED' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000254466;
      END;
    END;
  END;

********** LEAF    17  NODE  1291 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.2769667020129 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.25735634543626 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0128755984;
      END;
    END;
  END;

********** LEAF    18  NODE  1292 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.2769667020129 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.25735634543626 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0682284516;
      END;
    END;
  END;

********** LEAF    19  NODE  1293 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.2769667020129 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 55.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007175672;
      END;
    END;
  END;

********** LEAF    20  NODE  1294 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.2769667020129 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      55.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0271863892;
      END;
    END;
  END;

********** LEAF    21  NODE  1298 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.0359112;
      END;
    END;
  END;

********** LEAF    22  NODE  1299 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('HOUSTON' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0193573686;
      END;
    END;
  END;

********** LEAF    23  NODE  1300 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.25 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001464133;
      END;
    END;
  END;

********** LEAF    24  NODE  1301 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.25 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0210441842;
      END;
    END;
  END;

********** LEAF    25  NODE  1305 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.31402068808976 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ,'HOUSTON' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'SAN FRANCISCO' ,'MIAMI' ,'HOUSTON' ,'NEW YORK' ,'LOS ANGELES' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0515104719;
      END;
    END;
  END;

********** LEAF    26  NODE  1306 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.31402068808976 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'LOS ANGELES' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.022523801;
      END;
    END;
  END;

********** LEAF    27  NODE  1307 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.31402068808976 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.56943349997276 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0012293684;
      END;
    END;
  END;

********** LEAF    28  NODE  1308 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.31402068808976 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.56943349997276 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.023174924;
      END;
    END;
  END;

********** LEAF    29  NODE  1312 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 47.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                420.9 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0532786678;
      END;
    END;
  END;

********** LEAF    30  NODE  1313 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 47.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     420.9 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00768308;
      END;
    END;
  END;

********** LEAF    31  NODE  1314 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    47.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.021212772;
      END;
    END;
  END;

********** LEAF    32  NODE  1315 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    47.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0385295749;
      END;
    END;
  END;

********** LEAF    33  NODE  1319 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'HOUSTON' ,
      'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'HOUSTON' ,'CHICAGO' ,
        'LOS ANGELES' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0149751677;
      END;
    END;
  END;

********** LEAF    34  NODE  1320 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('LOS ANGELES' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.034369959;
      END;
    END;
  END;

********** LEAF    35  NODE  1321 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  451 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.106432522;
      END;
    END;
  END;

********** LEAF    36  NODE  1322 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       451 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008557635;
      END;
    END;
  END;

********** LEAF    37  NODE  1326 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.99815861589837 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.88151065450925 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003699106;
      END;
    END;
  END;

********** LEAF    38  NODE  1327 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.99815861589837 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.88151065450925 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0474261494;
      END;
    END;
  END;

********** LEAF    39  NODE  1328 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.99815861589837 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'CLOTHING' ,'ELECTRONICS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.092826162;
      END;
    END;
  END;

********** LEAF    40  NODE  1329 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.99815861589837 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.02215716;
      END;
    END;
  END;

********** LEAF    41  NODE  1333 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'SAN FRANCISCO' ,
      'CHICAGO' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1212.8 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0002232372;
      END;
    END;
  END;

********** LEAF    42  NODE  1334 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'SAN FRANCISCO' ,
      'CHICAGO' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1212.8 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0343007635;
      END;
    END;
  END;

********** LEAF    43  NODE  1335 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'CHICAGO' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 38.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.032175013;
      END;
    END;
  END;

********** LEAF    44  NODE  1336 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'CHICAGO' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      38.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0071671207;
      END;
    END;
  END;

********** LEAF    45  NODE  1340 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     4.01634243798381 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Discount_Applied_Binary  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0102925859;
      END;
    END;
  END;

********** LEAF    46  NODE  1341 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     4.01634243798381 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008752601;
      END;
    END;
  END;

********** LEAF    47  NODE  1339 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        4.01634243798381 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.087844366;
    END;
  END;

********** LEAF    48  NODE  1345 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.83939449909957 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <      3.8176519431297 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0031286311;
      END;
    END;
  END;

********** LEAF    49  NODE  1346 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.83939449909957 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
           3.8176519431297 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0969230432;
      END;
    END;
  END;

********** LEAF    50  NODE  1347 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.83939449909957 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'BOOKS' ,'CLOTHING' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.049732719;
      END;
    END;
  END;

********** LEAF    51  NODE  1348 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.83939449909957 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0067321956;
      END;
    END;
  END;

********** LEAF    52  NODE  1352 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
    'CHICAGO' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ,
      'SAN FRANCISCO' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <              1160.45 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.000808987;
      END;
    END;
  END;

********** LEAF    53  NODE  1353 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
    'CHICAGO' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ,
      'SAN FRANCISCO' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                   1160.45 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0277640862;
      END;
    END;
  END;

********** LEAF    54  NODE  1354 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                683.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0212130931;
      END;
    END;
  END;

********** LEAF    55  NODE  1355 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     683.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.041163937;
      END;
    END;
  END;

********** LEAF    56  NODE  1359 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ,'BOOKS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'BOOKS' ,'CLOTHING' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
      'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ,
        'HOUSTON' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.020663226;
      END;
    END;
  END;

********** LEAF    57  NODE  1360 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ,'BOOKS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'BOOKS' ,'CLOTHING' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('HOUSTON' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0151901769;
      END;
    END;
  END;

********** LEAF    58  NODE  1361 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     2.52492800362476 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0430426048;
      END;
    END;
  END;

********** LEAF    59  NODE  1362 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          2.52492800362476 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0033004602;
      END;
    END;
  END;

********** LEAF    60  NODE  1366 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.75 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 15.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0529766754;
      END;
    END;
  END;

********** LEAF    61  NODE  1367 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.75 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      15.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019249629;
      END;
    END;
  END;

********** LEAF    62  NODE  1368 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.75 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  478 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0673302129;
      END;
    END;
  END;

********** LEAF    63  NODE  1369 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.75 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       478 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0041995596;
      END;
    END;
  END;

********** LEAF    64  NODE  1373 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     4.01634243798381 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013899784;
      END;
    END;
  END;

********** LEAF    65  NODE  1374 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     4.01634243798381 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0061633274;
      END;
    END;
  END;

********** LEAF    66  NODE  1372 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        4.01634243798381 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.078419436;
    END;
  END;

********** LEAF    67  NODE  1376 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  407 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.116497652;
    END;
  END;

********** LEAF    68  NODE  1378 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     407 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007225759;
      END;
    END;
  END;

********** LEAF    69  NODE  1379 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     407 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('BOOKS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0090235886;
      END;
    END;
  END;

********** LEAF    70  NODE  1381 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.01267584536757 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0701785937;
    END;
  END;

********** LEAF    71  NODE  1383 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.01267584536757 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Discount_Applied_Binary  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0068300687;
      END;
    END;
  END;

********** LEAF    72  NODE  1384 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.01267584536757 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009883411;
      END;
    END;
  END;

********** LEAF    73  NODE  1388 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('GOLD' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Membership_Type  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_6 NOTIN (
        'GOLD' ,'SILVER' ,'BRONZE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0111381234;
      END;
    END;
  END;

********** LEAF    74  NODE  1389 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('SILVER' ,'BRONZE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.040302872;
      END;
    END;
  END;

********** LEAF    75  NODE  1390 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('NEUTRAL' ,'UNSATISFIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.006714082;
      END;
    END;
  END;

********** LEAF    76  NODE  1391 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('NEUTRAL' ,'UNSATISFIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('BOOKS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0198463995;
      END;
    END;
  END;

********** LEAF    77  NODE  1395 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <               1497.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 3.75 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.012755568;
      END;
    END;
  END;

********** LEAF    78  NODE  1396 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <               1497.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      3.75 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0078264154;
      END;
    END;
  END;

********** LEAF    79  NODE  1394 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                  1497.5 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.09242734;
    END;
  END;

********** LEAF    80  NODE  1400 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 49.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.015821198;
      END;
    END;
  END;

********** LEAF    81  NODE  1401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 49.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0044617597;
      END;
    END;
  END;

********** LEAF    82  NODE  1402 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    49.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1351.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0166661841;
      END;
    END;
  END;

********** LEAF    83  NODE  1403 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    49.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1351.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0888723709;
      END;
    END;
  END;

********** LEAF    84  NODE  1407 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.15 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1386.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0049725299;
      END;
    END;
  END;

********** LEAF    85  NODE  1408 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.15 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1386.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0572690196;
      END;
    END;
  END;

********** LEAF    86  NODE  1409 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'LOS ANGELES' ,
      'HOUSTON' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ,
        'MIAMI' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004141362;
      END;
    END;
  END;

********** LEAF    87  NODE  1410 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('MIAMI' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.046276368;
      END;
    END;
  END;

********** LEAF    88  NODE  1414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.24990483516513 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 25.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0163243579;
      END;
    END;
  END;

********** LEAF    89  NODE  1415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.24990483516513 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      25.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.058324233;
      END;
    END;
  END;

********** LEAF    90  NODE  1416 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.24990483516513 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.38424660582431 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0089265987;
      END;
    END;
  END;

********** LEAF    91  NODE  1417 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.24990483516513 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.38424660582431 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008112077;
      END;
    END;
  END;

********** LEAF    92  NODE  1421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.01267584536757 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                 1225 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0947148483;
      END;
    END;
  END;

********** LEAF    93  NODE  1422 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.01267584536757 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                      1225 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.122322613;
      END;
    END;
  END;

********** LEAF    94  NODE  1423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.01267584536757 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <              1491.55 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002332471;
      END;
    END;
  END;

********** LEAF    95  NODE  1424 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.01267584536757 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                   1491.55 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0738433635;
      END;
    END;
  END;

********** LEAF    96  NODE  1426 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  405 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.104627508;
    END;
  END;

********** LEAF    97  NODE  1428 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     405 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1463.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0032548686;
      END;
    END;
  END;

********** LEAF    98  NODE  1429 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     405 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1463.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.031404541;
      END;
    END;
  END;

********** LEAF    99  NODE  1433 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ,'NEUTRAL' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.56943349997276 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0035460862;
      END;
    END;
  END;

********** LEAF   100  NODE  1434 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ,'NEUTRAL' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.56943349997276 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017447881;
      END;
    END;
  END;

********** LEAF   101  NODE  1435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('UNSATISFIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                685.3 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0383101008;
      END;
    END;
  END;

********** LEAF   102  NODE  1436 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('UNSATISFIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     685.3 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003154449;
      END;
    END;
  END;

********** LEAF   103  NODE  1440 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.97008562636021 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
      'HOUSTON' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0167193107;
      END;
    END;
  END;

********** LEAF   104  NODE  1441 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.97008562636021 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019098398;
      END;
    END;
  END;

********** LEAF   105  NODE  1442 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.97008562636021 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.41759229307365 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0129816783;
      END;
    END;
  END;

********** LEAF   106  NODE  1443 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.97008562636021 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.41759229307365 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.018039397;
      END;
    END;
  END;

********** LEAF   107  NODE  1447 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'CHICAGO' ,'MIAMI' ,'LOS ANGELES' ,
        'HOUSTON' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0255198856;
      END;
    END;
  END;

********** LEAF   108  NODE  1448 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('MIAMI' ,'LOS ANGELES' ,'HOUSTON' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007432683;
      END;
    END;
  END;

********** LEAF   109  NODE  1449 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.55 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.018512554;
      END;
    END;
  END;

********** LEAF   110  NODE  1450 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.55 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.01324291;
      END;
    END;
  END;

********** LEAF   111  NODE  1454 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.25 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 40.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009346713;
      END;
    END;
  END;

********** LEAF   112  NODE  1455 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.25 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      40.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.104377222;
      END;
    END;
  END;

********** LEAF   113  NODE  1456 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.25 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ) 
        THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ,'SAN FRANCISCO' ,
        'MIAMI' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0102576958;
      END;
    END;
  END;

********** LEAF   114  NODE  1457 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.25 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007163186;
      END;
    END;
  END;

********** LEAF   115  NODE  1459 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     1.86883480914168 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0782539243;
    END;
  END;

********** LEAF   116  NODE  1461 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        1.86883480914168 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               689.65 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0105192222;
      END;
    END;
  END;

********** LEAF   117  NODE  1462 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        1.86883480914168 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    689.65 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005415112;
      END;
    END;
  END;

********** LEAF   118  NODE  1466 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                 1498 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1484.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00146789;
      END;
    END;
  END;

********** LEAF   119  NODE  1467 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                 1498 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1484.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0677771933;
      END;
    END;
  END;

********** LEAF   120  NODE  1465 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                    1498 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.087666614;
    END;
  END;

********** LEAF   121  NODE  1471 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.75 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.88151065450925 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007842001;
      END;
    END;
  END;

********** LEAF   122  NODE  1472 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.75 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.88151065450925 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.0562666;
      END;
    END;
  END;

********** LEAF   123  NODE  1473 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.75 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'BOOKS' ,'CLOTHING' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004489003;
      END;
    END;
  END;

********** LEAF   124  NODE  1474 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.75 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0193483044;
      END;
    END;
  END;

********** LEAF   125  NODE  1478 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 18.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.41759229307365 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0057067633;
      END;
    END;
  END;

********** LEAF   126  NODE  1479 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 18.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.41759229307365 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0522595382;
      END;
    END;
  END;

********** LEAF   127  NODE  1480 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    18.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.74943486698846 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013186957;
      END;
    END;
  END;

********** LEAF   128  NODE  1481 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    18.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.74943486698846 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0095822606;
      END;
    END;
  END;

********** LEAF   129  NODE  1485 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                460.7 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               456.25 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019356578;
      END;
    END;
  END;

********** LEAF   130  NODE  1486 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                460.7 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    456.25 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.104349117;
      END;
    END;
  END;

********** LEAF   131  NODE  1487 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   460.7 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               689.65 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0218615304;
      END;
    END;
  END;

********** LEAF   132  NODE  1488 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   460.7 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    689.65 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00377936;
      END;
    END;
  END;

********** LEAF   133  NODE  1492 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <               1131.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.31402068808976 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0264869691;
      END;
    END;
  END;

********** LEAF   134  NODE  1493 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <               1131.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.31402068808976 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.011604939;
      END;
    END;
  END;

********** LEAF   135  NODE  1494 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                  1131.5 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.72562084249383 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0214625722;
      END;
    END;
  END;

********** LEAF   136  NODE  1495 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                  1131.5 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.72562084249383 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.028072785;
      END;
    END;
  END;

********** LEAF   137  NODE  1499 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 58.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.77269487480591 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0005470365;
      END;
    END;
  END;

********** LEAF   138  NODE  1500 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 58.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.77269487480591 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0249091567;
      END;
    END;
  END;

********** LEAF   139  NODE  1501 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    58.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' ,'HOUSTON' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.065518376;
      END;
    END;
  END;

********** LEAF   140  NODE  1502 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    58.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('HOUSTON' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0562464444;
      END;
    END;
  END;

********** LEAF   141  NODE  1504 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.05 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0920861107;
    END;
  END;

********** LEAF   142  NODE  1506 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.05 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1484.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00294779;
      END;
    END;
  END;

********** LEAF   143  NODE  1507 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.05 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1484.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0470334443;
      END;
    END;
  END;

********** LEAF   144  NODE  1511 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <              1460.25 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 17.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0254456064;
      END;
    END;
  END;

********** LEAF   145  NODE  1512 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <              1460.25 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      17.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002618045;
      END;
    END;
  END;

********** LEAF   146  NODE  1513 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                 1460.25 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1484.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.073134693;
      END;
    END;
  END;

********** LEAF   147  NODE  1514 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                 1460.25 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1484.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0129201208;
      END;
    END;
  END;

********** LEAF   148  NODE  1518 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.86067430630897 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'SAN FRANCISCO' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0098041704;
      END;
    END;
  END;

********** LEAF   149  NODE  1519 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.86067430630897 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00866422;
      END;
    END;
  END;

********** LEAF   150  NODE  1520 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.86067430630897 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.25 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.032217524;
      END;
    END;
  END;

********** LEAF   151  NODE  1521 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.86067430630897 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.25 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0232245339;
      END;
    END;
  END;

********** LEAF   152  NODE  1525 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.11326833464373 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000478278;
      END;
    END;
  END;

********** LEAF   153  NODE  1526 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.11326833464373 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0307370731;
      END;
    END;
  END;

********** LEAF   154  NODE  1527 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                491.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.094475863;
      END;
    END;
  END;

********** LEAF   155  NODE  1528 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '0' ,'1' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     491.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008902321;
      END;
    END;
  END;

********** LEAF   156  NODE  1532 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.15 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.92192431907623 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0110589969;
      END;
    END;
  END;

********** LEAF   157  NODE  1533 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.15 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.92192431907623 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.134554936;
      END;
    END;
  END;

********** LEAF   158  NODE  1534 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'HOUSTON' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0126656096;
      END;
    END;
  END;

********** LEAF   159  NODE  1535 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' )
       THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'HOUSTON' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.021992725;
      END;
    END;
  END;

********** LEAF   160  NODE  1537 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.05 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0838349144;
    END;
  END;

********** LEAF   161  NODE  1539 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.05 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                 1467 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0016580002;
      END;
    END;
  END;

********** LEAF   162  NODE  1540 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.05 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                      1467 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.024787735;
      END;
    END;
  END;

********** LEAF   163  NODE  1544 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     3.77269487480591 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.72562084249383 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0000318843;
      END;
    END;
  END;

********** LEAF   164  NODE  1545 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     3.77269487480591 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.72562084249383 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.088604057;
      END;
    END;
  END;

********** LEAF   165  NODE  1546 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        3.77269487480591 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                 1192 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0386590658;
      END;
    END;
  END;

********** LEAF   166  NODE  1547 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        3.77269487480591 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                      1192 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.037580488;
      END;
    END;
  END;

********** LEAF   167  NODE  1549 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                  9.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0732765308;
    END;
  END;

********** LEAF   168  NODE  1551 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                     9.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0074949851;
      END;
    END;
  END;

********** LEAF   169  NODE  1552 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                     9.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009464161;
      END;
    END;
  END;

********** LEAF   170  NODE  1556 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                424.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 23.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0862332728;
      END;
    END;
  END;

********** LEAF   171  NODE  1557 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                424.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      23.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0049830841;
      END;
    END;
  END;

********** LEAF   172  NODE  1558 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   424.5 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 47.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.006079068;
      END;
    END;
  END;

********** LEAF   173  NODE  1559 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   424.5 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      47.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0133283096;
      END;
    END;
  END;

********** LEAF   174  NODE  1563 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_6 = PUT( Membership_Type , $6.);
   %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('GOLD' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.67622055012179 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0275141925;
      END;
    END;
  END;

********** LEAF   175  NODE  1564 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_6 = PUT( Membership_Type , $6.);
   %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('GOLD' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.67622055012179 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009058537;
      END;
    END;
  END;

********** LEAF   176  NODE  1565 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_6 = PUT( Membership_Type , $6.);
   %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('SILVER' ,'BRONZE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Membership_Type  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_6 NOTIN (
      'GOLD' ,'SILVER' ,'BRONZE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                 1420 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007647941;
      END;
    END;
  END;

********** LEAF   177  NODE  1566 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_6 = PUT( Membership_Type , $6.);
   %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('SILVER' ,'BRONZE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Membership_Type  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_6 NOTIN (
      'GOLD' ,'SILVER' ,'BRONZE' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                      1420 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0549972772;
      END;
    END;
  END;

********** LEAF   178  NODE  1570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 10.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('BOOKS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'BOOKS' ,'ELECTRONICS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0809309376;
      END;
    END;
  END;

********** LEAF   179  NODE  1571 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 10.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002053128;
      END;
    END;
  END;

********** LEAF   180  NODE  1572 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    10.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('SATISFIED' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013413726;
      END;
    END;
  END;

********** LEAF   181  NODE  1573 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    10.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('NEUTRAL' ,'UNSATISFIED' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0023744518;
      END;
    END;
  END;

********** LEAF   182  NODE  1577 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     4.01634243798381 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <      3.4811217321331 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.011210557;
      END;
    END;
  END;

********** LEAF   183  NODE  1578 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     4.01634243798381 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
           3.4811217321331 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0068140196;
      END;
    END;
  END;

********** LEAF   184  NODE  1576 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        4.01634243798381 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.091844856;
    END;
  END;

********** LEAF   185  NODE  1580 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  405 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.101916635;
    END;
  END;

********** LEAF   186  NODE  1582 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     405 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.65 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002749863;
      END;
    END;
  END;

********** LEAF   187  NODE  1583 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     405 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.65 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0161546652;
      END;
    END;
  END;

********** LEAF   188  NODE  1587 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 10.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                  4.8 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.102660351;
      END;
    END;
  END;

********** LEAF   189  NODE  1588 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 10.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                       4.8 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0002270032;
      END;
    END;
  END;

********** LEAF   190  NODE  1589 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    10.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <      3.4811217321331 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010107812;
      END;
    END;
  END;

********** LEAF   191  NODE  1590 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    10.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
           3.4811217321331 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0061753892;
      END;
    END;
  END;

********** LEAF   192  NODE  1594 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 21.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 20.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0069131884;
      END;
    END;
  END;

********** LEAF   193  NODE  1595 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 21.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      20.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0750663654;
      END;
    END;
  END;

********** LEAF   194  NODE  1596 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    21.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.35 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013651558;
      END;
    END;
  END;

********** LEAF   195  NODE  1597 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    21.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.35 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0105761912;
      END;
    END;
  END;

********** LEAF   196  NODE  1601 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.011827913;
      END;
    END;
  END;

********** LEAF   197  NODE  1602 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0218283706;
      END;
    END;
  END;

********** LEAF   198  NODE  1603 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Discount_Applied_Binary  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1218.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.018314537;
      END;
    END;
  END;

********** LEAF   199  NODE  1604 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Discount_Applied_Binary  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1218.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.012621952;
      END;
    END;
  END;

********** LEAF   200  NODE  1608 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.31402068808976 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                714.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.012095574;
      END;
    END;
  END;

********** LEAF   201  NODE  1609 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.31402068808976 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     714.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0433691406;
      END;
    END;
  END;

********** LEAF   202  NODE  1610 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.31402068808976 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 11.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.034856223;
      END;
    END;
  END;

********** LEAF   203  NODE  1611 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.31402068808976 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      11.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000818323;
      END;
    END;
  END;

********** LEAF   204  NODE  1615 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.4811217321331 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.026405505;
      END;
    END;
  END;

********** LEAF   205  NODE  1616 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.4811217321331 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'HOME GOODS' ,'CLOTHING' ,'BOOKS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0014118503;
      END;
    END;
  END;

********** LEAF   206  NODE  1617 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.4811217321331 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('GOLD' ,'SILVER' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Membership_Type  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_6 NOTIN (
        'GOLD' ,'SILVER' ,'BRONZE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001253661;
      END;
    END;
  END;

********** LEAF   207  NODE  1618 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.4811217321331 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('BRONZE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0180329329;
      END;
    END;
  END;

********** LEAF   208  NODE  1622 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 24.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.25 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.021443981;
      END;
    END;
  END;

********** LEAF   209  NODE  1623 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 24.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.25 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002428932;
      END;
    END;
  END;

********** LEAF   210  NODE  1624 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    24.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('GOLD' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0155916419;
      END;
    END;
  END;

********** LEAF   211  NODE  1625 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    24.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('SILVER' ,'BRONZE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Membership_Type  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_6 NOTIN (
        'GOLD' ,'SILVER' ,'BRONZE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013406972;
      END;
    END;
  END;

********** LEAF   212  NODE  1629 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 12.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0865125732;
      END;
    END;
  END;

********** LEAF   213  NODE  1630 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      12.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.014837516;
      END;
    END;
  END;

********** LEAF   214  NODE  1631 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'HOUSTON' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
      'CHICAGO' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('GOLD' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.02134773;
      END;
    END;
  END;

********** LEAF   215  NODE  1632 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'HOUSTON' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
      'CHICAGO' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('SILVER' ,'BRONZE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Membership_Type  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_6 NOTIN (
        'GOLD' ,'SILVER' ,'BRONZE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001556517;
      END;
    END;
  END;

********** LEAF   216  NODE  1636 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 50.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009877685;
      END;
    END;
  END;

********** LEAF   217  NODE  1637 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 50.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0138517368;
      END;
    END;
  END;

********** LEAF   218  NODE  1638 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    50.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0393737908;
      END;
    END;
  END;

********** LEAF   219  NODE  1639 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    50.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0005690596;
      END;
    END;
  END;

********** LEAF   220  NODE  1643 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                691.3 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.51143404304132 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0030919194;
      END;
    END;
  END;

********** LEAF   221  NODE  1644 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                691.3 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.51143404304132 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.056471756;
      END;
    END;
  END;

********** LEAF   222  NODE  1645 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   691.3 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  753 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.038171302;
      END;
    END;
  END;

********** LEAF   223  NODE  1646 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                   691.3 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       753 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003246367;
      END;
    END;
  END;

********** LEAF   224  NODE  1650 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' ,'MIAMI' ,
      'HOUSTON' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 44.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.014078446;
      END;
    END;
  END;

********** LEAF   225  NODE  1651 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' ,'MIAMI' ,
      'HOUSTON' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      44.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0143030456;
      END;
    END;
  END;

********** LEAF   226  NODE  1652 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('MIAMI' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                933.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0009581438;
      END;
    END;
  END;

********** LEAF   227  NODE  1653 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('MIAMI' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     933.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0351670023;
      END;
    END;
  END;

********** LEAF   228  NODE  1657 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.55 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.65057390292801 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.036889177;
      END;
    END;
  END;

********** LEAF   229  NODE  1658 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.55 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.65057390292801 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0081350948;
      END;
    END;
  END;

********** LEAF   230  NODE  1659 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.55 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  478 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0381882044;
      END;
    END;
  END;

********** LEAF   231  NODE  1660 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.55 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       478 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0014929843;
      END;
    END;
  END;

********** LEAF   232  NODE  1664 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.90192165176938 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 3.15 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.033282403;
      END;
    END;
  END;

********** LEAF   233  NODE  1665 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.90192165176938 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      3.15 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0073335634;
      END;
    END;
  END;

********** LEAF   234  NODE  1666 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.90192165176938 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.25 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.042195354;
      END;
    END;
  END;

********** LEAF   235  NODE  1667 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.90192165176938 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.25 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0091968627;
      END;
    END;
  END;

********** LEAF   236  NODE  1671 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ,'UNSATISFIED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'UNSATISFIED' ,'NEUTRAL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                689.8 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0131487692;
      END;
    END;
  END;

********** LEAF   237  NODE  1672 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ,'UNSATISFIED' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'UNSATISFIED' ,'NEUTRAL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     689.8 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.014032128;
      END;
    END;
  END;

********** LEAF   238  NODE  1673 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('NEUTRAL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1463.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0134562581;
      END;
    END;
  END;

********** LEAF   239  NODE  1674 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('NEUTRAL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1463.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.083415803;
      END;
    END;
  END;

********** LEAF   240  NODE  1678 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 58.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.86067430630897 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.000432247;
      END;
    END;
  END;

********** LEAF   241  NODE  1679 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 58.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.86067430630897 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.038034963;
      END;
    END;
  END;

********** LEAF   242  NODE  1680 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    58.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('SATISFIED' ,'NEUTRAL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.069019136;
      END;
    END;
  END;

********** LEAF   243  NODE  1681 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    58.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('UNSATISFIED' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0044166249;
      END;
    END;
  END;

********** LEAF   244  NODE  1685 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  436 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                423.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.024402642;
      END;
    END;
  END;

********** LEAF   245  NODE  1686 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  436 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     423.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.104813478;
      END;
    END;
  END;

********** LEAF   246  NODE  1687 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     436 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     2.52492800362476 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0159006327;
      END;
    END;
  END;

********** LEAF   247  NODE  1688 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     436 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          2.52492800362476 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003542823;
      END;
    END;
  END;

********** LEAF   248  NODE  1692 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.86067430630897 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.74943486698846 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00149091;
      END;
    END;
  END;

********** LEAF   249  NODE  1693 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.86067430630897 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.74943486698846 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0285963575;
      END;
    END;
  END;

********** LEAF   250  NODE  1694 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.86067430630897 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0240794182;
      END;
    END;
  END;

********** LEAF   251  NODE  1695 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.86067430630897 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.044507524;
      END;
    END;
  END;

********** LEAF   252  NODE  1699 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.2769667020129 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 3.75 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.018342342;
      END;
    END;
  END;

********** LEAF   253  NODE  1700 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.2769667020129 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      3.75 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0496121355;
      END;
    END;
  END;

********** LEAF   254  NODE  1701 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.2769667020129 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1369.6 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007596805;
      END;
    END;
  END;

********** LEAF   255  NODE  1702 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.2769667020129 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1369.6 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0179883901;
      END;
    END;
  END;

********** LEAF   256  NODE  1706 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <              1468.25 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001999397;
      END;
    END;
  END;

********** LEAF   257  NODE  1707 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <              1468.25 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.01647064;
      END;
    END;
  END;

********** LEAF   258  NODE  1708 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                 1468.25 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1485.2 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.08771397;
      END;
    END;
  END;

********** LEAF   259  NODE  1709 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                 1468.25 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1485.2 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013249861;
      END;
    END;
  END;

********** LEAF   260  NODE  1713 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.24990483516513 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 17.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.078784732;
      END;
    END;
  END;

********** LEAF   261  NODE  1714 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.24990483516513 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      17.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.034052055;
      END;
    END;
  END;

********** LEAF   262  NODE  1715 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.24990483516513 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('SATISFIED' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005039492;
      END;
    END;
  END;

********** LEAF   263  NODE  1716 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.24990483516513 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('NEUTRAL' ,'UNSATISFIED' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0105943926;
      END;
    END;
  END;

********** LEAF   264  NODE  1720 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <              475.625 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  405 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.103949952;
      END;
    END;
  END;

********** LEAF   265  NODE  1721 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <              475.625 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       405 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0311458023;
      END;
    END;
  END;

********** LEAF   266  NODE  1722 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                 475.625 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 54.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00682934;
      END;
    END;
  END;

********** LEAF   267  NODE  1723 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                 475.625 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      54.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0211490218;
      END;
    END;
  END;

********** LEAF   268  NODE  1727 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  439 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002295923;
      END;
    END;
  END;

********** LEAF   269  NODE  1728 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                  439 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.086574421;
      END;
    END;
  END;

********** LEAF   270  NODE  1729 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     439 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               456.25 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.073405888;
      END;
    END;
  END;

********** LEAF   271  NODE  1730 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                     439 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    456.25 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0010511757;
      END;
    END;
  END;

********** LEAF   272  NODE  1734 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 4.75 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.023608619;
      END;
    END;
  END;

********** LEAF   273  NODE  1735 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      4.75 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0499325256;
      END;
    END;
  END;

********** LEAF   274  NODE  1736 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.025351515;
      END;
    END;
  END;

********** LEAF   275  NODE  1737 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' )
       THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'MIAMI' ,'SAN FRANCISCO' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001483486;
      END;
    END;
  END;

********** LEAF   276  NODE  1741 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.55 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'HOUSTON' ,'CHICAGO' ) 
        THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'HOUSTON' ,'CHICAGO' ,'MIAMI' ,
        'LOS ANGELES' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.015560737;
      END;
    END;
  END;

********** LEAF   277  NODE  1742 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.55 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('MIAMI' ,'LOS ANGELES' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0087257406;
      END;
    END;
  END;

********** LEAF   278  NODE  1743 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.55 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 28.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001762225;
      END;
    END;
  END;

********** LEAF   279  NODE  1744 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.55 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      28.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0449342244;
      END;
    END;
  END;

********** LEAF   280  NODE  1748 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <      3.6242520361853 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               440.85 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.031008598;
      END;
    END;
  END;

********** LEAF   281  NODE  1749 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <      3.6242520361853 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    440.85 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0051047941;
      END;
    END;
  END;

********** LEAF   282  NODE  1750 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
         3.6242520361853 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.38424660582431 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0234030204;
      END;
    END;
  END;

********** LEAF   283  NODE  1751 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
         3.6242520361853 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.38424660582431 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.030438725;
      END;
    END;
  END;

********** LEAF   284  NODE  1755 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.15 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.76092962610081 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.044372565;
      END;
    END;
  END;

********** LEAF   285  NODE  1756 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.15 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.76092962610081 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.1077999583;
      END;
    END;
  END;

********** LEAF   286  NODE  1757 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 55.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000043616;
      END;
    END;
  END;

********** LEAF   287  NODE  1758 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      55.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0211194753;
      END;
    END;
  END;

********** LEAF   288  NODE  1762 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     3.59721842555016 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.51143404304132 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0028990072;
      END;
    END;
  END;

********** LEAF   289  NODE  1763 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     3.59721842555016 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.51143404304132 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0463167854;
      END;
    END;
  END;

********** LEAF   290  NODE  1764 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        3.59721842555016 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 58.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008396177;
      END;
    END;
  END;

********** LEAF   291  NODE  1765 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        3.59721842555016 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      58.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.088037454;
      END;
    END;
  END;

********** LEAF   292  NODE  1769 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
    'HOUSTON' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
      'CHICAGO' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 56.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0009368637;
      END;
    END;
  END;

********** LEAF   293  NODE  1770 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
    'HOUSTON' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
      'CHICAGO' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      56.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.035138775;
      END;
    END;
  END;

********** LEAF   294  NODE  1771 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('CHICAGO' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 38.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.070171789;
      END;
    END;
  END;

********** LEAF   295  NODE  1772 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('CHICAGO' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      38.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001193129;
      END;
    END;
  END;

********** LEAF   296  NODE  1776 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.15 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 27.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0067334015;
      END;
    END;
  END;

********** LEAF   297  NODE  1777 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.15 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      27.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.074493485;
      END;
    END;
  END;

********** LEAF   298  NODE  1778 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0119907522;
      END;
    END;
  END;

********** LEAF   299  NODE  1779 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004094899;
      END;
    END;
  END;

********** LEAF   300  NODE  1783 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Discount_Applied_Binary  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
      'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,'CHICAGO' ,
        'SAN FRANCISCO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0137847578;
      END;
    END;
  END;

********** LEAF   301  NODE  1784 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Discount_Applied_Binary  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.024423849;
      END;
    END;
  END;

********** LEAF   302  NODE  1785 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.92192431907623 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00272061;
      END;
    END;
  END;

********** LEAF   303  NODE  1786 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( Discount_Applied_Binary , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.92192431907623 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.050778063;
      END;
    END;
  END;

********** LEAF   304  NODE  1790 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                 1492 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <              1470.75 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0012279525;
      END;
    END;
  END;

********** LEAF   305  NODE  1791 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                 1492 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                   1470.75 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.044596753;
      END;
    END;
  END;

********** LEAF   306  NODE  1789 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                    1492 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0759757787;
    END;
  END;

********** LEAF   307  NODE  1795 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <      3.8176519431297 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 39.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0122263673;
      END;
    END;
  END;

********** LEAF   308  NODE  1796 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <      3.8176519431297 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      39.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010932361;
      END;
    END;
  END;

********** LEAF   309  NODE  1797 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
         3.8176519431297 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 3.15 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.1203458545;
      END;
    END;
  END;

********** LEAF   310  NODE  1798 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
         3.8176519431297 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      3.15 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.042573163;
      END;
    END;
  END;

********** LEAF   311  NODE  1802 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 32.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
      'HOUSTON' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0110103035;
      END;
    END;
  END;

********** LEAF   312  NODE  1803 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 32.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.053908894;
      END;
    END;
  END;

********** LEAF   313  NODE  1804 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    32.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.06778244554087 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017070319;
      END;
    END;
  END;

********** LEAF   314  NODE  1805 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    32.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.06778244554087 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0032389332;
      END;
    END;
  END;

********** LEAF   315  NODE  1809 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.15 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                455.7 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0466106657;
      END;
    END;
  END;

********** LEAF   316  NODE  1810 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 3.15 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                     455.7 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.0497849;
      END;
    END;
  END;

********** LEAF   317  NODE  1811 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.74943486698846 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001607323;
      END;
    END;
  END;

********** LEAF   318  NODE  1812 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    3.15 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.74943486698846 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0241328375;
      END;
    END;
  END;

********** LEAF   319  NODE  1814 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     2.01267584536757 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.0658451533;
    END;
  END;

********** LEAF   320  NODE  1816 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.01267584536757 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'HOUSTON' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'MIAMI' ,'HOUSTON' ,'SAN FRANCISCO' ,'LOS ANGELES' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0073043898;
      END;
    END;
  END;

********** LEAF   321  NODE  1817 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        2.01267584536757 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'LOS ANGELES' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00817173;
      END;
    END;
  END;

********** LEAF   322  NODE  1821 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ,'NEUTRAL' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'BOOKS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'BOOKS' ,'HOME GOODS' ,'CLOTHING' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.010418718;
      END;
    END;
  END;

********** LEAF   323  NODE  1822 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('SATISFIED' ,'NEUTRAL' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( IMP_Satisfaction_Level  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'SATISFIED' ,'NEUTRAL' ,'UNSATISFIED' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0098298224;
      END;
    END;
  END;

********** LEAF   324  NODE  1823 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('UNSATISFIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.83939449909957 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0078753244;
      END;
    END;
  END;

********** LEAF   325  NODE  1824 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( IMP_Satisfaction_Level , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('UNSATISFIED' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.83939449909957 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0879524219;
      END;
    END;
  END;

********** LEAF   326  NODE  1828 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                 1467 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0119686496;
      END;
    END;
  END;

********** LEAF   327  NODE  1829 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <                 1467 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'HOME GOODS' ,'CLOTHING' ,'BOOKS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007695574;
      END;
    END;
  END;

********** LEAF   328  NODE  1830 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                    1467 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1484.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.066913815;
      END;
    END;
  END;

********** LEAF   329  NODE  1831 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                    1467 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1484.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009897995;
      END;
    END;
  END;

********** LEAF   330  NODE  1835 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'HOME GOODS' ,'CLOTHING' ,'BOOKS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <      3.4811217321331 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.021044382;
      END;
    END;
  END;

********** LEAF   331  NODE  1836 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('ELECTRONICS' ,'HOME GOODS' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_11 NOTIN (
      'ELECTRONICS' ,'HOME GOODS' ,'CLOTHING' ,'BOOKS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
           3.4811217321331 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0010919807;
      END;
    END;
  END;

********** LEAF   332  NODE  1837 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'HOUSTON' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'MIAMI' ,'HOUSTON' ,'CHICAGO' ,'SAN FRANCISCO' ,
        'LOS ANGELES' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001231294;
      END;
    END;
  END;

********** LEAF   333  NODE  1838 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_11 = PUT( FavoriteCategory , $11.);
   %DMNORMIP( _ARBFMT_11);
    IF _ARBFMT_11 IN ('CLOTHING' ,'BOOKS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'LOS ANGELES' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0213894582;
      END;
    END;
  END;

********** LEAF   334  NODE  1842 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.25 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
        'CHICAGO' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0157737482;
      END;
    END;
  END;

********** LEAF   335  NODE  1843 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.25 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('HOUSTON' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004784032;
      END;
    END;
  END;

********** LEAF   336  NODE  1844 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.25 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.31402068808976 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.046923708;
      END;
    END;
  END;

********** LEAF   337  NODE  1845 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.25 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.31402068808976 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017098674;
      END;
    END;
  END;

********** LEAF   338  NODE  1849 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ,'SAN FRANCISCO' ,
      'HOUSTON' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 58.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002581147;
      END;
    END;
  END;

********** LEAF   339  NODE  1850 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ,'SAN FRANCISCO' ,
      'HOUSTON' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      58.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.049667963;
      END;
    END;
  END;

********** LEAF   340  NODE  1851 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 55.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0040940222;
      END;
    END;
  END;

********** LEAF   341  NODE  1852 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      55.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0571354468;
      END;
    END;
  END;

********** LEAF   342  NODE  1856 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.4811217321331 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <                  863 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.033926055;
      END;
    END;
  END;

********** LEAF   343  NODE  1857 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <      3.4811217321331 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                       863 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0017073154;
      END;
    END;
  END;

********** LEAF   344  NODE  1858 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.4811217321331 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.54085429305278 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0365180482;
      END;
    END;
  END;

********** LEAF   345  NODE  1859 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
         3.4811217321331 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.54085429305278 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0023155041;
      END;
    END;
  END;

********** LEAF   346  NODE  1863 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ,'SAN FRANCISCO' ,
      'HOUSTON' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ,'BOOKS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'BOOKS' ,'HOME GOODS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001846486;
      END;
    END;
  END;

********** LEAF   347  NODE  1864 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( City  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_13 NOTIN (
      'NEW YORK' ,'MIAMI' ,'LOS ANGELES' ,'CHICAGO' ,'SAN FRANCISCO' ,
      'HOUSTON' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('HOME GOODS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0261511107;
      END;
    END;
  END;

********** LEAF   348  NODE  1865 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('ELECTRONICS' ,'CLOTHING' ,'HOME GOODS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FavoriteCategory  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_11 NOTIN (
        'ELECTRONICS' ,'CLOTHING' ,'HOME GOODS' ,'BOOKS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.020896425;
      END;
    END;
  END;

********** LEAF   349  NODE  1866 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_13 = PUT( City , $13.);
   %DMNORMIP( _ARBFMT_13);
    IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'HOUSTON' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_11 = PUT( FavoriteCategory , $11.);
     %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('BOOKS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0161097655;
      END;
    END;
  END;

********** LEAF   350  NODE  1870 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.86067430630897 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
      LOG_IMP_Age  <     3.70122576040912 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001862821;
      END;
    END;
  END;

********** LEAF   351  NODE  1871 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.86067430630897 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_IMP_Age ) AND 
          3.70122576040912 <= LOG_IMP_Age  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0221237897;
      END;
    END;
  END;

********** LEAF   352  NODE  1872 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.86067430630897 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('GOLD' ,'BRONZE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Membership_Type  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_6 NOTIN (
        'GOLD' ,'BRONZE' ,'SILVER' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.036246005;
      END;
    END;
  END;

********** LEAF   353  NODE  1873 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.86067430630897 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_6 = PUT( Membership_Type , $6.);
     %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('SILVER' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0123173709;
      END;
    END;
  END;

********** LEAF   354  NODE  1877 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.23848618144484 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.25735634543626 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.086298445;
      END;
    END;
  END;

********** LEAF   355  NODE  1878 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
    LOG_IMP_Age  <     3.23848618144484 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.25735634543626 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005508532;
      END;
    END;
  END;

********** LEAF   356  NODE  1879 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.23848618144484 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1131.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.005028058;
      END;
    END;
  END;

********** LEAF   357  NODE  1880 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_IMP_Age ) AND 
        3.23848618144484 <= LOG_IMP_Age  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_IMP_Age  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1131.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0155489172;
      END;
    END;
  END;

********** LEAF   358  NODE  1884 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     3.77269487480591 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.72562084249383 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001721505;
      END;
    END;
  END;

********** LEAF   359  NODE  1885 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <     3.77269487480591 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.72562084249383 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.048672422;
      END;
    END;
  END;

********** LEAF   360  NODE  1886 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        3.77269487480591 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <      3.8176519431297 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0802546413;
      END;
    END;
  END;

********** LEAF   361  NODE  1887 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
        3.77269487480591 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
           3.8176519431297 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0104763906;
      END;
    END;
  END;

********** LEAF   362  NODE  1891 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <               456.25 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender_Binary  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0542227606;
      END;
    END;
  END;

********** LEAF   363  NODE  1892 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
    Total_Spend  <               456.25 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( Gender_Binary , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.042802591;
      END;
    END;
  END;

********** LEAF   364  NODE  1893 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                  456.25 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 18.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0141631771;
      END;
    END;
  END;

********** LEAF   365  NODE  1894 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Total_Spend ) AND 
                  456.25 <= Total_Spend  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Total_Spend  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      18.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.008287644;
      END;
    END;
  END;

********** LEAF   366  NODE  1898 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.65 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
      LOG_Items_Purchased  <     3.86067430630897 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00730869;
      END;
    END;
  END;

********** LEAF   367  NODE  1899 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
    Average_Rating  <                 4.65 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Average_Rating  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LOG_Items_Purchased ) AND 
          3.86067430630897 <= LOG_Items_Purchased  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0377705034;
      END;
    END;
  END;

********** LEAF   368  NODE  1900 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.65 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 22.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.005205007;
      END;
    END;
  END;

********** LEAF   369  NODE  1901 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Average_Rating ) AND 
                    4.65 <= Average_Rating  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      22.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0409491736;
      END;
    END;
  END;

********** LEAF   370  NODE  1905 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 60.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 58.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000937271;
      END;
    END;
  END;

********** LEAF   371  NODE  1906 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 60.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      58.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.041384532;
      END;
    END;
  END;

********** LEAF   372  NODE  1907 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    60.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
      Total_Spend  <               1196.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Total_Spend  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0947583883;
      END;
    END;
  END;

********** LEAF   373  NODE  1908 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    60.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Total_Spend ) AND 
                    1196.5 <= Total_Spend  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0015347676;
      END;
    END;
  END;

********** LEAF   374  NODE  1912 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <      3.0201273556387 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
      Days_Since_Last_Purchase  <                 60.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.007643333;
      END;
    END;
  END;

********** LEAF   375  NODE  1913 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
    LOG_Items_Purchased  <      3.0201273556387 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( LOG_Items_Purchased  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                      60.5 <= Days_Since_Last_Purchase  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0863185869;
      END;
    END;
  END;

********** LEAF   376  NODE  1914 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
         3.0201273556387 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
      Average_Rating  <                 3.85 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.02690624;
      END;
    END;
  END;

********** LEAF   377  NODE  1915 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(LOG_Items_Purchased ) AND 
         3.0201273556387 <= LOG_Items_Purchased  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Average_Rating ) AND 
                      3.85 <= Average_Rating  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Average_Rating  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.00036377;
      END;
    END;
  END;

********** LEAF   378  NODE  1919 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 23.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ,'CHICAGO' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.042430529;
      END;
    END;
  END;

********** LEAF   379  NODE  1920 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
    Days_Since_Last_Purchase  <                 23.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' )
       THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( City  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_13 NOTIN (
        'NEW YORK' ,'CHICAGO' ,'SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,
        'HOUSTON' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001858868;
      END;
    END;
  END;

********** LEAF   380  NODE  1921 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    23.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('NEW YORK' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0334062312;
      END;
    END;
  END;

********** LEAF   381  NODE  1922 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Days_Since_Last_Purchase ) AND 
                    23.5 <= Days_Since_Last_Purchase  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Days_Since_Last_Purchase  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_13 = PUT( City , $13.);
     %DMNORMIP( _ARBFMT_13);
      IF _ARBFMT_13 IN ('SAN FRANCISCO' ,'MIAMI' ,'LOS ANGELES' ,'HOUSTON' ,
*****************************************************************************************
NOTE: File view has been truncated.
Refer to /home/u63437975/WQD7005_AA1/Workspaces/EMWS1/Boost/EMFLOWSCORE.sas 
on this server for entire file contents.
*****************************************************************************************
