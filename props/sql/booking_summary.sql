SELECT DISTINCT CASE 
                  WHEN ( app_decision_code IN ( 0, 1, 4 ) ) THEN 'Not Approved' 
                  ELSE 
                    CASE 
                      WHEN ( app_decision_code = 5 ) THEN 'Cancelled' 
                      ELSE 
                        CASE 
                          WHEN ( app_decision_code = 6 ) THEN 'Rejected' 
                          ELSE 'Approved' 
                        END 
                    END 
                END                                      AS USER_DESC, 
                CASE 
                  WHEN app_contract_number IS NULL THEN co_ud_co_contract_id 
                  ELSE app_contract_number 
                END                                      AS COLUMN0049, 
                app_fkey                                 AS ACT_KEY, 
                co_custname, 
                Max(co_accountingownercode)              AS 
                MaxCo_accountingownercode, 
                co_purchaseoption_tbdesc, 
                co_programtype_tbdesc, 
                co_ud_co_advance_arrears, 
                co_branch_tbdesc, 
                Max(rep1)                                AS MaxRep1, 
                co_paymentamount                         AS 
                CO_UD_CO_ORIG_PYMT_AMT, 
                co_residualamount, 
                co_productline_tbdesc, 
                Min(co_termduration)                     AS MinCo_termduration, 
                co_equipmentcost, 
                Sum(as_listprice)                        AS SumAs_listprice, 
                Max (CASE 
                       WHEN ( co_roi_nompt IS NULL ) THEN 
                       as_pricing_target_yield_as 
                       ELSE co_roi_nompt 
                     END)                                AS 
                CO_PRICING_TARGET_YIELD, 
                scd_code                                 AS MaxScd_code, 
                local_sic_code, 
                Max(rep2)                                AS MaxRep2, 
                Max(rep3)                                AS MaxRep3, 
                co_promotion_tbdesc                      AS COLUMN0051, 
                CASE 
                  WHEN app_new_cust_yn = 1 THEN 'New' 
                  ELSE 'Existing' 
                END                                      AS COLUMN0067, 
                CASE 
                  WHEN co_productline = 0070 THEN 'Yes' 
                  ELSE 'No' 
                END                                      AS COLUMN0068, 
                co_ud_co_comp_conversion_tbdesc          AS 
                CO_UD_CO_COMP_CONVERSION_TBDES, 
                Cast(Max(rpt_co.co_bookingdate) AS DATE) AS CO_bookingDate 
FROM   rapport.dbo.rpt_asset RPT_ASSET 
       INNER JOIN rapport.dbo.rpt_co RPT_CO 
               ON rpt_asset.co_fkey = rpt_co.co_key 
       INNER JOIN rapport.dbo.application APPLICATIO 
               ON rpt_co.app_fkey = APPLICATIO.app_key 
       INNER JOIN rapport.dbo.marketing_reps MARKETING 
               ON rpt_asset.co_fkey = MARKETING.co_fkey 
       LEFT OUTER JOIN rapport.dbo.rpt_cust_data RPT_CUST_D 
                    ON APPLICATIO.cust_fkey = RPT_CUST_D.ent_fkey 
       LEFT OUTER JOIN rapport.dbo.decision_codes DECISION_C 
                    ON APPLICATIO.app_decision_code = 
                       DECISION_C.decision_code_key 
       LEFT OUTER JOIN rapport.dbo.rpt_sic_code RPT_SIC_CO 
                    ON RPT_CUST_D.cust_data_key = RPT_SIC_CO.cust_data_fkey 
       INNER JOIN rapport.dbo.change_history CHANGE_HIS 
               ON rpt_co.app_fkey = CHANGE_HIS.chg_app_fkey 
WHERE  (( app_decision_code NOT IN( 0, 1, 4, 5, 6 ) 
          AND co_equipmentcost <> 0 )) 
       AND scd_code <> '9999' 
       AND co_key NOT LIKE '%-2' 
       AND ( chg_field_name = 'UD_CO_APP_STATUS' 
             AND ( chg_old_data = '03' 
                    OR chg_new_data = '03' ) ) 
GROUP  BY CASE 
            WHEN ( app_decision_code IN ( 0, 1, 4 ) ) THEN 'Not Approved' 
            ELSE 
              CASE 
                WHEN ( app_decision_code = 5 ) THEN 'Cancelled' 
                ELSE 
                  CASE 
                    WHEN ( app_decision_code = 6 ) THEN 'Rejected' 
                    ELSE 'Approved' 
                  END 
              END 
          END, 
          CASE 
            WHEN app_contract_number IS NULL THEN co_ud_co_contract_id 
            ELSE app_contract_number 
          END, 
          app_fkey, 
          co_custname, 
          co_purchaseoption_tbdesc, 
          co_programtype_tbdesc, 
          co_ud_co_advance_arrears, 
          co_branch_tbdesc, 
          co_paymentamount, 
          co_residualamount, 
          co_productline_tbdesc, 
          co_equipmentcost, 
          scd_code, 
          local_sic_code, 
          co_promotion_tbdesc, 
          CASE 
            WHEN app_new_cust_yn = 1 THEN 'New' 
            ELSE 'Existing' 
          END, 
          CASE 
            WHEN co_productline = 0070 THEN 'Yes' 
            ELSE 'No' 
          END, 
          co_ud_co_comp_conversion_tbdesc 
HAVING Max(rep1) <> '' 
       AND Min (CASE 
                  WHEN ( chg_field_name = 'UD_CO_APP_STATUS' 
                         AND ( chg_new_data = '01' 
                                OR chg_new_data = '03' ) ) THEN chg_date_time 
                END) BETWEEN ? AND ? 
ORDER  BY 3 