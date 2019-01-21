SELECT DISTINCT  
	LS_MASTER.ID,
	LEAD_BANK,
	UATB_SC_CUST_NAME,
	CUST_ID,
	LS_MASTE_U.UATB_SC_PRIOR_AU_READINGS,
	LS_MASTE_U.UATB_SC_PRIOR_AU_READING_DATES,
	UATB_SC_UM_ALPHA_NUM2,
	UATB_SC_UM_USER_DATE1,
	BOOKING_DATE,
	CONTRACT_TERM,
	UATB_SC_BRANCH,
	UATB_NUM_MONTHS_ELAPSED,
	UATB_PCT_TERM_ELAPSED,
	UATB_PROC_UTILIZATION,
	UATB_JS_UTIL_COMP AS UATB_UT_COMPLIANCE,
	UATB_SC_MRKTNG_REP2_DESC,
	UATB_SC_MRKTNG_REP3_DESC 
FROM 
	LS_MASTER_RPTS_NF LS_MASTER,  
	LS_MASTE_UATB_SC_PRIOR_A_PH LS_MASTE_U,  
	LS_MASTE_UATB_SC_PRIOR_A_PH LS_MASTE_U_1,  
	LS_MASTE_UATB_SC_PRIOR_AU LS_MASTE_U_2 
WHERE 
	LS_MASTER.ID = LS_MASTE_U.ID
	AND LS_MASTER.ID = LS_MASTE_U_1.ID
	AND LS_MASTER.ID = LS_MASTE_U_2.ID
	AND ( ( UATB_SC_INVOICE_CODE <> 'N'
	AND UATB_SC_NUM_OF_ASSETS > 0
	AND UATB_SC_ACTIV_DATE IS NOT NULL
	AND UATB_SC_LESSOR IN( '002', '012', '102' )
	AND UATB_SC_ASSET_USAGE_BLANK IS NULL
	AND UATB_SC_PRIOR_AU_READING_METH <> 'I')
	AND PROGRAM_TYPE NOT IN( '8' )) 
