/*********************************************************
* Client:
* Project: 	Xanomeline 

* Program: 

* SAS Version:9.4
* Author: Vilda
*********************************************************/

libname adam "/home/u64409252/ADAM_SDTM/ADaM_DATA" ;

data adsl1;
set adam.adsl;
keep usubjid SAFFL ITTFL EFFFL DISCONFL;
run;

data adsl2;
set adsl1;
retain LNT 0 P 1;
LNT+1;

if LNT > 20 Then do;
P = P + 1;
LNT=1;
END;
run;

%include "/home/u64409252/ADAM_SDTM/Program/RTF.sas";

%_RTFSTYLE_;


title1 j=l "Xanomeline";
title2 j=l "Protocol: 043";
title3 j=c "18.2.1.1 Analysis Populations";

options orientation=landscape;
ODS escapechar='^';
ods rtf file="/home/u64409252/ADAM_SDTM/Output/L_20_2_1_1.RTF" style=Styles.Test;

PROC REPORT DATA=adsl2 NOWD SPLIT="|";
COLUMN P usubjid SAFFL ITTFL EFFFL DISCONFL;

DEFINE P/ORDER NOPRINT;

DEFINE USUBJID /ORDER "Subject|Number"
STYLE (HEADER) ={JUST=L CELLWIDTH=20%}
STYLE (COLUMN) ={JUST=L CELLWIDTH=20%};

DEFINE SAFFL / "Safety|Population"
STYLE (HEADER) ={JUST=L CELLWIDTH=20%}
STYLE (COLUMN) ={JUST=L CELLWIDTH=20%};

DEFINE ITTFL / "Intent-To-Treatment|Population"
STYLE (HEADER) ={JUST=L CELLWIDTH=20%}
STYLE (COLUMN) ={JUST=L CELLWIDTH=20%};

DEFINE EFFFL / "Efficacy|Population"
STYLE (HEADER) ={JUST=L CELLWIDTH=20%}
STYLE (COLUMN) ={JUST=L CELLWIDTH=20%};

DEFINE DISCONFL / "Discontinued|Population"
STYLE (HEADER) ={JUST=L CELLWIDTH=19%}
STYLE (COLUMN) ={JUST=L CELLWIDTH=19%};

compute before _page_;
  line@1 "^{style[outputwidth=100% bordertopwidth=0.5pt]}";
endcomp;

compute after _page_;
  line@1 "^{style[outputwidth=100% bordertopwidth=0.5pt]}";
endcomp;

break after P/PAGE;

Run;

ODS _ALL_ CLOSE;
