SELECT DISTINCT APP_FKEY                    AS ACT_KEY, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS MP_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS MP_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS MP_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS MP_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS MP_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_ROLLOVER_NET_INVOICE, 
                0                           AS MP_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS MP_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS MP_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS MP_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS MP_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'MP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS MP_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS INNOVX_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS INNOVX_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS INNOVX_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS INNOVX_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS INNOVX_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_ROLLOVER_NET_INVOICE, 
                0                           AS INNOVX_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS INNOVX_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS INNOVX_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS INNOVX_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS INNOVX_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'INNOV-X' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS INNOVX_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS SP_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS SP_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS SP_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS SP_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS SP_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_ROLLOVER_NET_INVOICE, 
                0                           AS SP_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS SP_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS SP_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS SP_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS SP_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SP' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SP_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC = 
                                'NON OAI EQUIPMENT' 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS NON_OAI_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC = 
                                'NON OAI EQUIPMENT' THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS NON_OAI_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC = 
                                'NON OAI EQUIPMENT' THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS NON_OAI_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS NON_OAI_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC = 
                                'NON OAI EQUIPMENT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS NON_OAI_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_ROLLOVER_NET_INVOICE, 
                0                           AS NON_OAI_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS NON_OAI_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC = 
                                'NON OAI EQUIPMENT' THEN 
                       AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS NON_OAI_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC = 
                                'NON OAI EQUIPMENT' THEN 
                       AS_rentalAmount 
                       ELSE 0 
                     END)                   AS NON_OAI_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NON OAI' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NON_OAI_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'NON DISC ITMOTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS GY_ENGY_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_ENGY_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_ENGY_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_ENGY_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS GY_ENGY_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_ROLLOVER_NET_INVOICE, 
                0                           AS GY_ENGY_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS GY_ENGY_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS GY_ENGY_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS GY_ENGY_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENGY' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENGY_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS GY_ENT_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_ENT_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_ENT_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_ENT_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS GY_ENT_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_ROLLOVER_NET_INVOICE, 
                0                           AS GY_ENT_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS GY_ENT_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS GY_ENT_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS GY_ENT_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY ENT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_ENT_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS GY_UG_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_UG_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_UG_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS GY_UG_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS GY_UG_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_ROLLOVER_NET_INVOICE, 
                0                           AS GY_UG_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS GY_UG_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS GY_UG_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS GY_UG_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS GY_UG_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'GY U/G' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS GY_UG_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS NDT_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS NDT_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS NDT_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS NDT_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS NDT_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_ROLLOVER_NET_INVOICE, 
                0                           AS NDT_ROLLOVER_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS NDT_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS NDT_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS NDT_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS NDT_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'NDT' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS NDT_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS SEG_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS SEG_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS SEG_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS SEG_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS SEG_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_ROLLOVER_NET_INVOICE, 
                0                           AS COLUMN0014, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS SEG_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS SEG_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS SEG_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS SEG_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_PREMIUM, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) 
                            AND ( AS_model NOT IN ( 'FREIGHT', 'BILLED & OUT' ) 
                                   OR AS_model IS NULL ) THEN AS_listPrice 
                       ELSE 0 
                     END)                   AS SEG_IND_LISTPRICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_SALES_DISCOUNT 
                       ELSE 0 
                     END)                   AS SEG_IND_SALES_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK', 
                                'OTHER FINANCED' ) THEN 
                       AS_UD_AS_ADD_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS SEG_IND_ADDL_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) THEN 
                       AS_UD_AS_BLIND_DISCOUNT 
                       ELSE 0 
                     END)                   AS SEG_IND_BLIND_DISC, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS SEG_IND_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'ROLLOVER MID', 'ROLLOVER EOT' ) 
                            AND AS_model IN ( 'PVRESIDUAL', 'ETA ROLLOVER' ) 
                     THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS COLUMN0034, 
                0                           AS SEG_IND_ROLLOVER_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'FREIGHT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_FREIGHT, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_totalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_NONDISCITM_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'NON DISC ITM' THEN 
                       AS_residualAmount 
                       ELSE 0 
                     END)                   AS SEG_IND_NONDISCITM_RESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PROP TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_PROPTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'UPFRONT TAX' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_UPFRONTTAX_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 'LOAN' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'LOAN' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_LOAN_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'OTHER FINANCED' ) 
                            AND AS_UD_AS_MODEL_TBDESC NOT IN ( 
                                'FREIGHT', 'NON DISC ITM', 'PROP TAX', 
                                'UPFRONT TAX', 
                                'BILLED & OUT', 'PVFCF', 'PVRESIDUAL', 
                                'PREMIUM' 
                                  ) THEN AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_ALLOTHR_NET_INVOICE, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_UD_AS_OTHER_COSTS_TOTAL 
                       ELSE 0 
                     END)                   AS SEG_IND_TRADE_IN, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_EQUIP_DESCRIP_TBDESC IN ( 
                                'B/O', 'EUA', 'SALE LEASE BACK' ) 
                     THEN AS_rentalAmount 
                       ELSE 0 
                     END)                   AS SEG_IND_RENTAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'BILLED & OUT' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_BILLED_OUTSTANDING, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVFCF' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_PVFCF, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PVRESIDUAL' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_PVRESIDUAL, 
                Sum (CASE 
                       WHEN AS_UD_AS_PROD_GRP_TBDESC = ( 'SEG IND' ) 
                            AND AS_UD_AS_MODEL_TBDESC = 'PREMIUM' THEN 
                       AS_originalCost 
                       ELSE 0 
                     END)                   AS SEG_IND_PREMIUM, 
                CASE 
                  WHEN RPT_CO.CO_downPayment IS NULL THEN 0 
                  ELSE RPT_CO.CO_downPayment 
                END                         AS CO_downPayment, 
                CASE 
                  WHEN RPT_CO.CO_UD_CO_MP_SERVICE IS NULL THEN 0 
                  ELSE RPT_CO.CO_UD_CO_MP_SERVICE 
                END                         AS CO_UD_CO_MP_SERVICE, 
                CASE 
                  WHEN RPT_CO.CO_UD_CO_SP_SERVICE IS NULL THEN 0 
                  ELSE RPT_CO.CO_UD_CO_SP_SERVICE 
                END                         AS CO_UD_CO_SP_SERVICE, 
                CASE 
                  WHEN RPT_CO.CO_UD_CO_GYRUS_SERVICE IS NULL THEN 0 
                  ELSE RPT_CO.CO_UD_CO_GYRUS_SERVICE 
                END                         AS CO_UD_CO_GYRUS_SERVICE, 
                CO_UD_CO_TOT_ET_USAGE, 
                CO_UD_CO_ENDO_CAPSULE, 
                CO_UD_CO_ENDO_WORKS, 
                CO_UD_CO_ENDOWORKS_CHARGES, 
                CASE 
                  WHEN RPT_CO.CO_UD_CO_EW7_MAINT IS NULL THEN 0 
                  ELSE RPT_CO.CO_UD_CO_EW7_MAINT 
                END                         AS CO_UD_CO_EW7_MAINT, 
                CO_UD_CO_TOT_PER_LEAS_PYMT, 
                CASE 
                  WHEN CO_productLine = '0045' THEN CO_UD_CO_MP_PVFCF_REMOVE 
                  WHEN CO_productLine = '0046' THEN CO_UD_CO_SP_PVFCF_REMOVE 
                  WHEN CO_productLine = '0025' THEN CO_UD_CO_NDT_PVFCF_REMOV 
                  WHEN CO_productLine = '0030' THEN CO_UD_CO_SEG_PVFCF_REMOV 
                  WHEN CO_productLine = '0035' THEN CO_UD_CO_SEG_IND_PVFCF_REMOV 
                  WHEN CO_productLine = '0066' THEN CO_UD_CO_GY_ENT_PVFCF_REMOV 
                  WHEN CO_productLine = '0065' THEN CO_UD_CO_GY_ACMI_PVFCF_REM 
                  WHEN CO_productLine = '0067' THEN CO_UD_CO_GY_SUR_PVFCF_REM 
                  WHEN CO_productLine = '0024' THEN CO_UD_CO_INNX_PVFCF_REMOVE 
                  ELSE 0.00 
                END                         AS COLUMN0065, 
                Max(CO_UD_CO_SERVICE_TOTAL) AS MaxCo_ud_co_service_total, 
                CO_UD_CO_PVR_ROLLOVER, 
                CO_UD_CO_PVFCF_ROLLOVER 
FROM   Rapport.dbo.RPT_ASSET RPT_ASSET 
       INNER JOIN Rapport.dbo.RPT_CO RPT_CO 
               ON RPT_ASSET.CO_FKEY = RPT_CO.CO_KEY 
       INNER JOIN Rapport.dbo.APPLICATION APPLICATIO 
               ON RPT_CO.APP_FKEY = APPLICATIO.APP_KEY 
       INNER JOIN Rapport.dbo.Marketing_Reps MARKETING 
               ON RPT_ASSET.CO_FKEY = MARKETING.CO_FKEY 
       LEFT OUTER JOIN Rapport.dbo.RPT_CUST_DATA RPT_CUST_D 
                    ON APPLICATIO.CUST_FKEY = RPT_CUST_D.ENT_FKEY 
       LEFT OUTER JOIN Rapport.dbo.DECISION_CODES DECISION_C 
                    ON APPLICATIO.APP_DECISION_CODE = 
                       DECISION_C.DECISION_CODE_KEY 
       LEFT OUTER JOIN Rapport.dbo.RPT_SIC_CODE RPT_SIC_CO 
                    ON RPT_CUST_D.CUST_DATA_KEY = RPT_SIC_CO.CUST_DATA_FKEY 
       INNER JOIN Rapport.dbo.CHANGE_HISTORY CHANGE_HIS 
               ON RPT_CO.APP_FKEY = CHANGE_HIS.CHG_APP_FKEY 
WHERE  ( APP_DECISION_CODE NOT IN( 0, 1, 4, 5, 6 ) 
         AND CO_equipmentCost <> 0 ) 
       AND SCD_CODE <> '9999' 
       AND CO_KEY NOT LIKE '%-2' 
       AND ( CHG_FIELD_NAME = 'UD_CO_APP_STATUS' 
             AND ( CHG_OLD_DATA = '03' 
                    OR CHG_NEW_DATA = '03' ) 
             AND APP_FKEY = ? ) 
GROUP  BY APP_FKEY, 
          CASE 
            WHEN RPT_CO.CO_downPayment IS NULL THEN 0 
            ELSE RPT_CO.CO_downPayment 
          END, 
          CASE 
            WHEN RPT_CO.CO_UD_CO_MP_SERVICE IS NULL THEN 0 
            ELSE RPT_CO.CO_UD_CO_MP_SERVICE 
          END, 
          CASE 
            WHEN RPT_CO.CO_UD_CO_SP_SERVICE IS NULL THEN 0 
            ELSE RPT_CO.CO_UD_CO_SP_SERVICE 
          END, 
          CASE 
            WHEN RPT_CO.CO_UD_CO_GYRUS_SERVICE IS NULL THEN 0 
            ELSE RPT_CO.CO_UD_CO_GYRUS_SERVICE 
          END, 
          CO_UD_CO_TOT_ET_USAGE, 
          CO_UD_CO_ENDO_CAPSULE, 
          CO_UD_CO_ENDO_WORKS, 
          CO_UD_CO_ENDOWORKS_CHARGES, 
          CASE 
            WHEN RPT_CO.CO_UD_CO_EW7_MAINT IS NULL THEN 0 
            ELSE RPT_CO.CO_UD_CO_EW7_MAINT 
          END, 
          CO_UD_CO_TOT_PER_LEAS_PYMT, 
          CASE 
            WHEN CO_productLine = '0045' THEN CO_UD_CO_MP_PVFCF_REMOVE 
            WHEN CO_productLine = '0046' THEN CO_UD_CO_SP_PVFCF_REMOVE 
            WHEN CO_productLine = '0025' THEN CO_UD_CO_NDT_PVFCF_REMOV 
            WHEN CO_productLine = '0030' THEN CO_UD_CO_SEG_PVFCF_REMOV 
            WHEN CO_productLine = '0035' THEN CO_UD_CO_SEG_IND_PVFCF_REMOV 
            WHEN CO_productLine = '0066' THEN CO_UD_CO_GY_ENT_PVFCF_REMOV 
            WHEN CO_productLine = '0065' THEN CO_UD_CO_GY_ACMI_PVFCF_REM 
            WHEN CO_productLine = '0067' THEN CO_UD_CO_GY_SUR_PVFCF_REM 
            WHEN CO_productLine = '0024' THEN CO_UD_CO_INNX_PVFCF_REMOVE 
            ELSE 0.00 
          END, 
          CO_UD_CO_PVR_ROLLOVER, 
          CO_UD_CO_PVFCF_ROLLOVER 
HAVING Max(REP1) <> '' 
ORDER  BY 1 