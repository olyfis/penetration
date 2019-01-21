SELECT DISTINCT  
                ID,
                UATB_SC_CUST_NAME,
                BOOKING_DATE 
FROM 
                LS_MASTER_RPTS_NF LS_MASTER 
WHERE 
                UATB_JS_IN_EVERGREEN = 'Y'
                AND UATB_SC_INVOICE_CODE <> 'N'  order by BOOKING_DATE ASC
